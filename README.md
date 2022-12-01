# container-virt-v2v

## To run virt-v2v migration

```
docker run --name virt-v2v -tid -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock -v <disk-path>:/mnt:rw -v <filesystem-path>:/var/tmp:rw  quay.io/zachelnet/virt-v2v:latest
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
source Openrc.sh
virt-v2v -of [qcow2|raw] -i disk <disk-path> -o glance
```

## Workaround glance timeout:
```
virt-v2v -of raw -i disk <disk-path> -o disk -os .

# For Windows Hyper-V Uefi Windows VMs:
openstack image create --min-ram 2048 --property architecture=x86_64 --property hypervisor_type=kvm --property vm_mode=hvm --property hw_disk_bus=virtio --property hw_vif_model=virtio --property hw_video_model=qxl --property hw_machine_type=pc --property os_type=windows --property os_distro=windows --property hw_cpu_sockets=1 --property hw_cpu_cores=1 --property os_version=10 --property hw_rng_model=virtio --property hw_firmware_type=uefi --disk-format=raw --container-format=bare --file <disk-file> <image-name>
```
