# HOWTO IGEL Managed Containers™ (IMC)

- Secure, governed containerized workloads for the distributed edge.

- IGEL Managed Containers™ (IMC) extends the IGEL Adaptive Secure Endpoint Platform™ with a managed container workload model for delivering controlled, policy-aligned applications and services.

- Run containerized workloads on the immutable IGEL OS™ foundation, connect to existing OCI-compliant registries, and centrally govern deployment and lifecycle operations through the IGEL Universal Management Suite. IGEL Managed Containers helps organizations bring modern application flexibility to IT and OT environments while preserving endpoint trust, operational control, and enterprise policy alignment.

- [IGEL Web Site: IGEL Managed Containers™](https://www.igel.com/secure-managed-containers/)

- [IGEL KB: IGEL Managed Containers™](https://kb.igel.com/igel-managed-containers/current)

-----

-----

## HOWTO Docker

**NOTE:** As for 8 August 2026, IMC cannot be used to create container images. The IGEL Community has an [app recipe for Docker](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Apps/docker)

Docker is a platform that lets you package, ship, and run applications in lightweight, portable units called containers.

Docker makes it easy to run an application the same way everywhere—on your laptop, a server, or in the cloud—without worrying about differences in operating systems or installed software.

- [IGEL Community: HOWTO Docker](./HOWTO-Docker.md)

-----

-----

## Install IMC on IGEL OS

Follow steps outlined here:

- [IGEL KB: IGEL Managed Containers™](https://kb.igel.com/igel-managed-containers/current)

Summary of steps:

- [Create a profile, include the IMC app, to configure the container storage](https://kb.igel.com/igel-managed-containers/current/prerequisites-for-running-the-igel-managed-containers-app#Creating-the-Profile-to-Configure-the-Container-Storage) as a percentage of remaining disk space on IGEL OS 12.10.0+. This will allocate from the 64GB IGEL OS disk

- Assign the profile to IGEL OS device and select `Save and apply now`. This will apply the profile, install the IMC app, reboot device and allocate the storage for containers

- If you are connecting to `container registries` (a service that stores and distributes container images) that require authentication, then create a profile to [configure container registry credentials](https://kb.igel.com/igel-managed-containers/current/prerequisites-for-running-the-igel-managed-containers-app#Configuring-Container-Registry-Credential), assign the profile to IGEL OS device and select `Save and apply now`

-----

-----

## Steps to create a container

Create two profiles and a container compose file (`my-container-compose.yaml`).

- [IGEL KB: How to Manage Containers in the IGEL UMS Web App](https://kb.igel.com/igel-managed-containers/current/how-to-manage-containers-in-the-igel-ums-web-app)

Summary of steps:

- Create `IMC` folder in `Configuration -> Files`

- Use UMS Web App Files (`Configuration -> Files`) to upload your `my-container-compose.yaml` file into folder `IMC` with these settings:

```
    Classification: Undefined
    Device file location: /services_rw/imc/config/
        Owner: Root
        Owner access rights:
            Read
            Write
        Other access rights:
            Read
```

- **Profile for the Container Configuration File:** Create a profile, with IGEL BASE OS 12.10.0+, that will use the above `yaml` file. Save the profile. Then open this profile. Go to `Contained Files` and, in the `Assign file` search bar, enter the file name of the container configuration file (`my-container-compose.yaml`). Once the entry with the same file name appears, select it, save profile, assign to IGEL OS device,  and select `Save and apply now`

- **Container Profile:** Create a profile, with IGEL IMC app, add the container name (`my-container`) via `Apps > IGEL Managed Containers > Containers and click Add item`, in settings for the newly added container, add the container yaml file from above (`my-container-compose.yaml`), save profile, assign to IGEL OS device,  and select `Save and apply now`

-----

-----

## Create a Container Registry to Store and Distribute Container Images

- Create container for OCI Registry - `oci-registry-compose.yaml`

```bash linenums="1"
cat << "EOF" > oci-registry-compose.yaml
services:
  registry:
    image: docker.io/library/registry:2
    container_name: oci-registry

    ports:
      - "5000:5000"

    environment:
      REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY: /var/lib/registry

    volumes:
      - "/services_rw/imc/container_data/volumes/registry:/var/lib/registry:rw"
EOF
```

- Follow [Steps to create a container](#steps-to-create-a-container)

```
yaml: oci-registry-compose.yaml
container: oci-registry
```

- Start container

- Test connection:

```bash
SERVER=10.0.0.12
curl http://${SERVER}:5000/v2/_catalog
```

- Upload [IGEL UMS Java Console Image](./HOWTO-Docker.md/#use-docker-to-run-igel-ums-java-console)

```bash
SERVER=10.0.0.12
docker tag igel-ums:bookworm ${SERVER}:5000/igel-ums:bookworm
docker push ${SERVER}:5000/igel-ums:bookworm
```

**NOTE:** To use the docker tag/push to this `container registry` update the docker file `/etc/docker/daemon.json` with the following for this example of container running on IGEL OS device on the `10.0.0.0/24` network.

```json linenums="1"
"insecure-registries": ["10.0.0.0/24"]
```

- Updated `run-pull-docker-ums.sh`

```bash linenums="1"
cat << "EOF" > run-pull-docker-ums.sh
#!/bin/bash

set -euo pipefail

#
# For X11:
#   xhost +local:docker
#

xhost +local:docker

IMAGE="igel-ums:bookworm"
EXPORT_DIR="$(pwd)/container-export"

# OCI Registry container IP
OCI_REG_SRV="10.0.0.12"

mkdir -p "$EXPORT_DIR"

/services/docker/usr/bin/docker system prune -f

if /services/docker/usr/bin/docker image inspect "$IMAGE" >/dev/null 2>&1; then
    echo "Image $IMAGE exists."
else
    # echo "Image $IMAGE does not exist. Building it now."
    # /services/docker/usr/bin/docker build --network host -t "$IMAGE" .
    echo "Image $IMAGE does not exist. Pulling it now."
    IMAGE="${OIC_REG_SRV}:5000/igel-ums:bookworm"
    EXPORT_DIR="$(pwd)/container-export"
    mkdir -p "$EXPORT_DIR"
    /services/docker/usr/bin/docker system prune -f
    echo "Pulling latest image from private registry..."
    /services/docker/usr/bin/docker pull "$IMAGE"
fi

/services/docker/usr/bin/docker run --network host --rm -it \
  --user root \
  --security-opt seccomp=unconfined \
  -e DISPLAY="$DISPLAY" \
  -e HOST_UID="$(id -u)" \
  -e HOST_GID="$(id -g)" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e PULSE_SERVER=unix:/run/user/777/pulse/native \
  -e PULSE_COOKIE=/root/.config/pulse/cookie \
  -v /run/user/777/pulse:/run/user/777/pulse \
  -v /userhome/config/pulse/cookie:/root/.config/pulse/cookie:ro \
  -v "$EXPORT_DIR:/export" \
  --device=/dev/dri \
  --group-add video \
  --group-add audio \
  --shm-size=2g \
  --entrypoint /bin/bash \
  "$IMAGE" \
  -c '
    set +e

    echo "Restoring exported files..."

    if [ "$(find /export -mindepth 1 -print -quit 2>/dev/null)" ]; then
        cp -a /export/. /home/appuser/
        chown -R appuser:appuser /home/appuser
        echo "Restore complete."
    else
        echo "No exported files found."
    fi

    # Run the UMS Remote Manager as the non-root application user.
    runuser -u appuser -- env \
      HOME=/home/appuser \
      DISPLAY="$DISPLAY" \
      PULSE_SERVER="$PULSE_SERVER" \
      /opt/IGEL/RemoteManager/RemoteManager.sh
    RC=$?

    echo "Copying generated files to /export..."

    if [ -f /home/appuser/rmconsole.truststore ]; then
        cp -a /home/appuser/rmconsole.truststore /export/
    else
        echo "Warning: /home/appuser/rmconsole.truststore was not found."
    fi

    #if [ -d /home/appuser/.java ]; then
        #rm -rf /export/.java
        #cp -a /home/appuser/.java /export/
    #else
        #echo "Warning: /home/appuser/.java was not found."
    #fi
    cp -a /home/appuser/.* /export/

    # Make the copied files belong to the user who started the container.
    chown -R "$HOST_UID:$HOST_GID" /export

    echo "Export complete: /export"
    exit "$RC"
  '

echo "Files exported to: $EXPORT_DIR"
EOF
chmod a+x run-pull-docker-ums.sh
```
