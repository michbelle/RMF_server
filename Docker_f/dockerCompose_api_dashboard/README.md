# OPEN-RMF server for browser and remote api 

docker compose file with Api server and dashboard

```bash
docker compose -f $path_repo/tesi_code/src/myTesiCode/Dockerfiles/dockerCompose/rmf-web_base/compose.yml up 
```

## Api server

```yaml
image: ghcr.io/open-rmf/rmf-web/api-server:latest
    network_mode: "host"
    environment:
      - ROS_DOMAIN_ID=30
      - RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
```

## Dashboard

```yaml
image: ghcr.io/open-rmf/rmf-web/demo-dashboard:latest
    network_mode: "host"
    environment:
      - RMF_SERVER_URL=http://localhost:8000
      - TRAJECTORY_SERVER_URL=ws://localhost:8006
```