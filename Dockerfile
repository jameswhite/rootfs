FROM scratch
ADD rootfs.tar.xz /
CMD ["bash"]

# docker build --no-cache -t testing . && docker run -it --entrypoint /bin/bash testing
