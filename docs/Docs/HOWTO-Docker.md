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
- Run `docker` to collect the files and save into `artifacts` folder

### Save the following as `dockerfile`:

```dockerfile
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

### Run Docker with the following commands:

```bash linenums="1"
mkdir -p artifacts
docker system prune -f
docker buildx build --network host --target export --output type=local,dest=./artifacts .
```

- The deb files will be in the `artifacts` folder

-----

-----

## Using IGEL OS App SDK Docker image

Summary of steps:

- Download IGEL OS App SDK Docker image from [IGEL App Creator Portal](https://appcreator.igel.com/)
- Load the docker image
- Create `dockerfile`
- Zip up the recipe and any needed files into `recipe.zip`
- Run `docker` to build the image, collect the certificates, create zip file of results, and save into `artifacts` folder

### Load the docker image

**Note:** Docker must be run as root

```bash
docker load < igelpkg.tar
```

### Create recipe.zip

- To test out the workflow, download the [speedcrunch](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/raw/refs/heads/main/APP_Packages/Apps/speedcrunch_community.zip) calculator recipe zip from [IGEL-Community / IGEL-OS-APP-RECIPES](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES) and rename as `recipe.zip`

### Save the following as `dockerfile`:

```dockerfile
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

### Run Docker with the following commands:

```bash linenums="1"
mkdir -p artifacts
docker system prune -f
docker buildx build --network host --target export --output type=local,dest=./artifacts .
```

- The zip, `build_results.zip`, file will be in the `artifacts` folder