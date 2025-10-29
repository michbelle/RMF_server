## RMF server 

### API and Dashboard

docker compose file that holds the api and the 



### devcontainer

start ssh agent
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ecdsa
```

then run
```bash
DOCKER_BUILDKIT=1 docker build -t tesi_image . --ssh default
```


```bash
colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release --symlink-install 
```