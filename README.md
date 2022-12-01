# container-virt-v2v

## To run virt-v2v migration

```
docker run -ti -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock -v <disk-path>:/mnt:rw -v <filesystem-path>:/var/tmp:rw  quay.io/zachelnet/virt-v2v:latest
```

## MountPoint:
```
/var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock # Need for KVM
:/mnt           # Disk Files
:/var/tmp:rw    # Need for image build
```

## create Openrc.sh
```
export OS_AUTH_URL=public-api
export OS_PROJECT_ID=project-id
export OS_PROJECT_NAME="project"
export OS_USER_DOMAIN_NAME="default"

unset OS_TENANT_ID
unset OS_TENANT_NAME
export OS_USERNAME="user"
echo "Please enter your OpenStack Password for project $OS_PROJECT_NAME as user $OS_USERNAME: "
read -sr OS_PASSWORD_INPUT
export OS_PASSWORD=$OS_PASSWORD_INPUT

export OS_REGION_NAME="region-1"

export OS_INTERFACE=public
export OS_IDENTITY_API_VERSION=3

```

## Commando

```
irt-v2v -of qcow2 -i disk <disk-path> -o glance
```

