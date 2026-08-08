# IGEL Managed Containers™ (IMC)

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

- Use UMS Web App Files (Configuration -> Files) to upload your `my-container-compose.yaml` file with these settings:

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

- **Profile for the Container Configuration File:** Create a profile, with IGEL BASE OS 12.10.0+, that will use the above profile. Save the profile. Then open this profile. go to `Contained Files` and, in the `Assign file` search bar, enter the file name of the container configuration file (`my-container-compose.yaml`). Once the entry with the same file name appears, select it, save profile, assign to IGEL OS device,  and select `Save and apply now`

- **Container Profile:** Create a profile, with IGEL IGEL IMC app, add the container name (`my-container`) via `Apps > IGEL Managed Containers > Containers and click Add item`, in settings for the newly added container, add the container yaml file from above (`my-container-compose.yaml`), save profile, assign to IGEL OS device,  and select `Save and apply now`

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

