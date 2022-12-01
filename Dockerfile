FROM quay.io/centos/centos:stream8

RUN mkdir /disks && \
    yum -y update && \
    rm -rf /var/cache/yum && \
    yum install -y \
        qemu-guest-agent \
        qemu-img \
        qemu-kvm \
        virt-v2v \
        virtio-win && \
    yum install -y https://www.rdoproject.org/repos/rdo-release.el8.rpm && \
    yum install -y python3-openstackclient python3-glanceclient && \
    yum clean all
    
ENV LIBGUESTFS_BACKEND=direct
