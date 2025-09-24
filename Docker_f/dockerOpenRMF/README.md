### Open rmf images

```bash
docker pull ghcr.io/open-rmf/rmf/rmf_demos:jazzy-rmf-latest
docker tag ghcr.io/open-rmf/rmf/rmf_demos:jazzy-rmf-latest rmf:jazzy-rmf-latest
```
launch 

```bash
docker run -it --network host rmf:jazzy-rmf-latest bash
```


launch simulation

```bash
docker run -it --network host rmf:jazzy-rmf-latest bash -c "export ROS_DOMAIN_ID=9; ros2 launch rmf_demos_gz office.launch.xml headless:=1"
```

More info in at [link](https://github.com/open-rmf/rmf?tab=readme-ov-file#docker-containers)


### docker image custom

custom image is avaible in the .devcontainer