The Docker images that use `FROM: scratch` aren't really from scratch, they require a rootfs.tar.xz to get started. I was curious on how to build these so I created this script to build one in a docker image, but that requires an initial rootfs...

After the first rootfs is built, it will point to the rootfs it last built to build the next rootfs.

My rootfs images are about four times as large as the smallest I've found so I'll need to work on making them smaller. But at least I know how to make any kind of rootfs now.
