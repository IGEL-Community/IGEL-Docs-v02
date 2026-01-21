# HOWTO Docker

Docker is a platform that lets you package, ship, and run applications in lightweight, portable units called containers.

Docker makes it easy to run an application the same way everywhere—on your laptop, a server, or in the cloud—without worrying about differences in operating systems or installed software.

-----

-----

## Install Docker on IGEL OS

- Use [IGEL KB: IGEL App Creator Portal](https://kb.igel.com/igel-app-creator/current/igel-app-creator-portal) with the [Docker Recipe](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Apps/docker)

**NOTE:** Need to run docker as `root`.

-----

-----

## Test Docker with hello-world

```bash linenums="1"
docker run hello-world
```
What happens internally:

- Docker checks if the hello-world image exists locally
- If not, it pulls it from Docker Hub
- Docker creates and runs a container
- The container prints a message and exits

## Docker Examples

- Setup Debian Bookworm (12)

```bash linenums="1"
docker run --network host -it debian:bookworm bash -c \
"apt-get update && apt-get install -y curl iputils-ping && bash"
```

- Setup Ubuntu 22.04

```bash linenums="1"
docker run --network host -it ubuntu:22.04 bash -c \
"apt-get update && apt-get install -y curl iputils-ping && bash"
```

- List docker images

```bash linenums="1"
docker images
```

- Run debian:bookworm

```bash linenums="1"
docker run --network host -it debian:bookworm
```

- Run ubuntu:22.04

```bash linenums="1"
docker run --network host -it ubuntu:22.04
```

## Use Docker to collect latest deb files

Summary of steps:

- Create `dockerfile`
- Create `get-debs.sh` to collect deb files
- Create `run-docker.sh` to run `docker` to collect the files and save into `artifacts` folder

### Save the following as `dockerfile`:

```dockerfile linenums="1"
# Choose a base image
FROM debian:bookworm AS build

# Set a working directory inside the image
WORKDIR /tmp
COPY . .

# Copy deb collection script
COPY get-debs.sh .

# Install dependencies
RUN apt update && apt-get install -y curl gnupg | tee -a debug.txt

# run get-debs to collect the deb files
RUN bash ./get-debs.sh | tee -a debug.txt

# copy deb files to out folder
RUN mkdir -p /out
RUN cp -v *.deb /out/
RUN cp -v deb-listing.txt /out/
RUN cp -v debug.txt /out/

# copy files out of container
FROM scratch AS export
COPY --from=build /out/ /
```

### Save the following as `get-debs.sh`:

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

MISSING_LIBS="containerd.io docker-buildx-plugin docker-ce docker-ce-cli docker-ce-rootless-extras docker-compose-plugin"

apt install curl -y

curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/debian \
bookworm stable" | \
tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

mkdir build_tar
cd build_tar

for lib in $MISSING_LIBS; do
  apt-get download $lib
  ls $lib* >> deb-listing.txt
  mv $lib*.deb $lib.deb
done

mv *.deb ..
mv deb-listing.txt ..
cd ..
rm -rf build_tar
```

### Save the following as `run-docker.sh`:

```bash linenums="1"
#!/bin/bash

mkdir -p artifacts
docker system prune -f
docker buildx build --network host --target export --output type=local,dest=./artifacts .
```

- The deb files will be in the `artifacts` folder

-----

-----

## Run Chrome in Docker

Summary of steps:

- Create `dockerfile`
- Follow notes in `run-docker.sh` to setup X11 items
- Run `run-docker.sh` to build the image, install latest Chrome, and run Chrome

### Save the following as `dockerfile`:

```dockerfile linenums="1"
# Debian 12 (bookworm)
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
 && mkdir -p /etc/apt/keyrings \
 && curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub \
    | gpg --dearmor -o /etc/apt/keyrings/google-linux.gpg

RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-linux.gpg] \
    http://dl.google.com/linux/chrome/deb/ stable main" \
    > /etc/apt/sources.list.d/google-chrome.list

RUN apt-get update && apt-get install -y google-chrome-stable

# Create group and user
RUN groupadd -r appuser && useradd -r -g appuser -m appuser

# Switch to the new user
USER appuser

# Run Chrome
ENTRYPOINT ["google-chrome-stable"]
```

### Save the following as `run-docker.sh`:

```bash linenums="1"
#!/bin/bash

#
# For X11
# As user obtain xauth -f ~/.Xauthority list|tail -1
# As root xauth add string-from-above-command
# As root xhost +local:docker
#

docker system prune -f
docker build --network host -t chrome:bookworm .

docker run --network host --rm -it \
  --security-opt seccomp=unconfined \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  chrome:bookworm
```

-----

-----

## Using IGEL OS App SDK Docker image

Summary of steps:

- Download IGEL OS App SDK Docker image from [IGEL App Creator Portal](https://appcreator.igel.com/)
- Load the docker image
- Create `dockerfile`
- Zip up the recipe and any needed files into `recipe.zip`
- Create `run-docker.sh` to run `docker` to build the image, collect the certificates, create zip file of results, and save into `artifacts` folder

### Load the docker image

```bash
docker load < igelpkg.tar
```

### Create recipe.zip

- To test out the workflow, download the [speedcrunch](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/raw/refs/heads/main/APP_Packages/Apps/speedcrunch_community.zip) calculator recipe zip from [IGEL-Community / IGEL-OS-APP-RECIPES](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES) and rename as `recipe.zip`

### Save the following as `dockerfile`:

```dockerfile linenums="1"
# Choose a base image
FROM igelpkg:latest AS build

# Set a working directory inside the image
WORKDIR /tmp
COPY . .

# Copy zip of recipe and any needed files
RUN rm -rf /tmp/*
COPY recipe.zip .

# Install dependencies
RUN apt update && apt-get install -y zip

# unzip recipe
RUN unzip recipe.zip
RUN rm recipe.zip

# run igel packager
RUN igelpkg build -r bookworm -a x64 -sp -sa -l -sr

# copy certs
RUN cp /usr/share/igelpkg/certs/IGEL_OS_12_SDK-intermediate.crt .
RUN cp /usr/share/igelpkg/certs/IGEL_OS_12_SDK-leaf.crt .

# create zip file and copy to out folder
RUN mkdir -p /out
RUN zip -r build_results.zip *
RUN cp -v build_results.zip /out/

# copy files out of container
FROM scratch AS export
COPY --from=build /out/ /
```

### Save the following as `run-docker.sh`:

```bash linenums="1"
#!/bin/bash

mkdir -p artifacts
docker system prune -f
docker buildx build --network host --target export --output type=local,dest=./artifacts .
```

- The zip, `build_results.zip`, file will be in the `artifacts` folder

-----

-----

## Run Mono based app in Docker

Summary of steps:

- Create `dockerfile`
- Create `publish` folder and copy the mono application and its files into `publish`
- Follow notes in `run-docker.sh` to setup X11 items
- Run `run-docker.sh` to build the image, install mono, and run mono application

### Save the following as `dockerfile`:

```dockerfile linenums="1"
# Debian 12 (bookworm)
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites + Mono repo + mono runtime
RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates gnupg dirmngr wget \
    && rm -rf /var/lib/apt/lists/*

# Add Mono Project repository key + repo (signed-by style)
#RUN mkdir -p /etc/apt/keyrings \
#    && wget -qO /etc/apt/keyrings/mono-official-archive-keyring.gpg \
#         https://download.mono-project.com/repo/xamarin.gpg \
#    && echo "deb [signed-by=/etc/apt/keyrings/mono-official-archive-keyring.gpg] \
#         https://download.mono-project.com/repo/debian stable-bookworm main" \
#         > /etc/apt/sources.list.d/mono-official-stable.list

# Install Mono runtime (or replace with mono-complete if you need everything)
RUN apt-get update && apt-get install -y --no-install-recommends \
      mono-complete libgdiplus \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy a prebuilt app (e.g., MyApp.exe) into the image
COPY ./publish/ ./

# Run your app
# If your entrypoint is a single exe, this works well:
ENTRYPOINT ["mono", "MyApp.exe"]
```

### Save the following as `run-docker.sh`:

```bash linenums="1"
#!/bin/bash

#
# For X11
# As user obtain xauth -f ~/.Xauthority list|tail -1
# As root xauth add string-from-above-command
# As root xhost +local:docker
#

docker system prune -f
docker build --network host -t my-mono-app:bookworm .

docker run --network host --rm -it \
  --security-opt seccomp=unconfined \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  my-mono-app:bookworm
```