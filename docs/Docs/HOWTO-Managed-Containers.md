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

- If you are connecting to `container registries` (a service that stores and distributes container images) that require authentication, then create a profile to [configure container registry credentials](https://kb.igel.com/igel-managed-containers/current/prerequisites-for-running-the-igel-managed-containers-app#Configuring-Container-Registry-Credentials), assign the profile to IGEL OS device and select `Save and apply now`

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

- Create container for OCI Registry: `oci-registry-compose.yaml`

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
      REGISTRY_STORAGE_DELETE_ENABLED: "true"

    volumes:
      - "/services_rw/imc/container_data/volumes/registry:/var/lib/registry:rw"

    entrypoint:
      - /bin/sh
      - -c
      - |
        echo "Running registry garbage collection..."
        /bin/registry garbage-collect --delete-untagged /etc/docker/registry/config.yml

        echo "Starting OCI registry..."
        exec /bin/registry serve /etc/docker/registry/config.yml
EOF
```

- Follow [Steps to create a container](#steps-to-create-a-container)

```
yaml: oci-registry-compose.yaml
container: oci-registry
```

- Start container: [IGEL KB: How to Run a Container in the IGEL Managed Containers app](https://kb.igel.com/igel-managed-containers/current/how-to-run-a-container-in-the-igel-managed-containers-app)

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

-----

-----

## Remove Images from Container Registry

- Create remove images from container registry script: `oci-registry-delete-images.sh`

```bash linenums="1"
cat << "EOF" > oci-registry-delete-images.sh
#!/usr/bin/env bash
#set -x
#trap read debug

set -u

REGISTRY="${REGISTRY:-http://10.0.0.12:5000}"

ACCEPT_HEADER='application/vnd.oci.image.index.v1+json, application/vnd.oci.image.manifest.v1+json, application/vnd.docker.distribution.manifest.list.v2+json, application/vnd.docker.distribution.manifest.v2+json'

error()
{
    zenity --error \
        --title="OCI Registry" \
        --text="$1"
}

info()
{
    zenity --info \
        --title="OCI Registry" \
        --text="$1"
}

check_dependencies()
{
    local missing=()

    for cmd in curl jq zenity; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            missing+=("$cmd")
        fi
    done

    if (( ${#missing[@]} > 0 )); then
        printf 'Missing required commands: %s\n' "${missing[*]}" >&2
        exit 1
    fi
}

registry_check()
{
    if ! curl -fsS "${REGISTRY}/v2/" >/dev/null; then
        error "Cannot connect to registry:\n\n${REGISTRY}"
        exit 1
    fi
}

get_repositories()
{
    curl -fsS "${REGISTRY}/v2/_catalog" |
        jq -r '.repositories[]?'
}

get_tags()
{
    local repo="$1"

    curl -fsS "${REGISTRY}/v2/${repo}/tags/list" |
        jq -r '.tags[]?'
}

get_digest()
{
    local repo="$1"
    local tag="$2"

    curl -fsSI \
        -H "Accept: ${ACCEPT_HEADER}" \
        "${REGISTRY}/v2/${repo}/manifests/${tag}" |
        awk -F': ' '
            tolower($1) == "docker-content-digest" {
                gsub("\r", "", $2)
                print $2
                exit
            }
        '
}

delete_manifest()
{
    local repo="$1"
    local digest="$2"
    local response_file
    local status

    response_file=$(mktemp)

    status=$(
        curl -sS \
            -o "$response_file" \
            -w '%{http_code}' \
            -X DELETE \
            "${REGISTRY}/v2/${repo}/manifests/${digest}"
    )

    if [[ "$status" == "202" ]]; then
        rm -f "$response_file"
        return 0
    fi

    {
        echo "DELETE failed for ${repo}@${digest}"
        echo "HTTP status: ${status}"
        cat "$response_file"
    } >&2

    rm -f "$response_file"
    return 1
}

check_dependencies
registry_check

rows=()

mapfile -t repositories < <(get_repositories)

if (( ${#repositories[@]} == 0 )); then
    info "No repositories were found in:\n\n${REGISTRY}"
    exit 0
fi

for repo in "${repositories[@]}"; do

    mapfile -t tags < <(get_tags "$repo")

    for tag in "${tags[@]}"; do

        [[ -z "$tag" ]] && continue

        digest=$(get_digest "$repo" "$tag")

        if [[ -z "$digest" ]]; then
            digest="UNKNOWN"
        fi

        rows+=(
            FALSE
            "$repo"
            "$tag"
            "$digest"
        )
    done
done

if (( ${#rows[@]} == 0 )); then
    info "No tagged images were found in:\n\n${REGISTRY}"
    exit 0
fi

selection=$(
    zenity --list \
        --title="OCI Registry Cleanup" \
        --text="Select images/tags to delete from:\n${REGISTRY}" \
        --width=1100 \
        --height=600 \
        --checklist \
        --separator=$'\n' \
        --print-column=2,3 \
        --column="Delete" \
        --column="Repository" \
        --column="Tag" \
        --column="Digest" \
        "${rows[@]}"
)

rc=$?

if [[ $rc -ne 0 || -z "$selection" ]]; then
    exit 0
fi

declare -a delete_repos=()
declare -a delete_tags=()

while IFS='|' read -r repo tag; do
    [[ -z "$repo" || -z "$tag" ]] && continue

    delete_repos+=("$repo")
    delete_tags+=("$tag")
done <<< "$selection"

if (( ${#delete_repos[@]} == 0 )); then
    exit 0
fi

confirm_text="The following registry items will be deleted:\n\n"

for i in "${!delete_repos[@]}"; do
    confirm_text+="${delete_repos[$i]}:${delete_tags[$i]}\n"
done

confirm_text+="\nRegistry:\n${REGISTRY}\n\nContinue?"

zenity --question \
    --title="Confirm OCI Registry Deletion" \
    --width=550 \
    --text="$confirm_text"

if [[ $? -ne 0 ]]; then
    exit 0
fi

declare -a success=()
declare -a failed=()
declare -A deleted_digests=()

for i in "${!delete_repos[@]}"; do

    repo="${delete_repos[$i]}"
    tag="${delete_tags[$i]}"

    digest=$(get_digest "$repo" "$tag")

    if [[ -z "$digest" ]]; then
        failed+=("${repo}:${tag} - could not determine digest")
        continue
    fi

    key="${repo}@${digest}"

    if [[ -n "${deleted_digests[$key]:-}" ]]; then
        success+=("${repo}:${tag} - shared digest already deleted")
        continue
    fi

    if delete_manifest "$repo" "$digest"; then
        deleted_digests["$key"]=1
        success+=("${repo}:${tag}")
    else
        failed+=("${repo}:${tag}")
    fi
done

result=""

if (( ${#success[@]} > 0 )); then
    result+="Deleted:\n"

    for item in "${success[@]}"; do
        result+="  ${item}\n"
    done
fi

if (( ${#failed[@]} > 0 )); then
    result+="\nFailed:\n"

    for item in "${failed[@]}"; do
        result+="  ${item}\n"
    done
fi

if (( ${#failed[@]} == 0 )); then
    zenity --info \
        --title="OCI Registry Cleanup" \
        --width=550 \
        --text="$result"
else
    zenity --warning \
        --title="OCI Registry Cleanup" \
        --width=550 \
        --text="$result"
fi
EOF
chmod a+x oci-registry-delete-images.sh
```