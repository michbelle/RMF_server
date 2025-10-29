docker run \
        -td \
        --network=host \
        --cap-add=SYS_PTRACE \
        --security-opt=seccomp:unconfined \
        --security-opt=apparmor:unconfined \
        --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
        --volume=/mnt/wslg:/mnt/wslg \
        --ipc=host \
        --device=/dev/dri \
        --volume=/run/user/1000:/run/user/1000 \
        -e DISPLAY=$DISPLAY \
        -e XAUTHORITY=$XAUTHORITY \
        --user ros \
        --name=rmf_server_elettra \
        rmf_server_elettra \
        bash