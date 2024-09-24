FROM scratch
ADD rootfs.tar.xz /
RUN apt-get update --allow-unauthenticated --allow-insecure-repositories \
 && apt-get install -y --no-install-recommends apt-file binfmt-support dialog debootstrap file git locales net-tools vim wget xz-utils \
 && apt-file update                                                         \
 && mkdir /rootfs && debootstrap --variant=minbase --arch=amd64 --foreign bookworm /rootfs && cp /etc/resolv.conf /rootfs/etc/resolv.conf && touch /rootfs/debootstrap/mirror \
 && cp /chroot-work /rootfs/chroot-work \
 && chroot /rootfs /chroot-work > /var/log/chroot-work.log 2> /var/log/chroot-work.err

CMD ["bash"]

# docker build --no-cache -t testing . && docker run -it --entrypoint /bin/bash testing
