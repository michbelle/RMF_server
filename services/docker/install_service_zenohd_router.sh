cat << EOF2 | sudo tee /usr/sbin/zenoh_router
#!/bin/bash

docker exec -i --user ros rmf_server_elettra  bash -c "source /opt/ros/jazzy/setup.bash && source /home/ros/.bashrc && /usr/bin/zenohd"

EOF2

sudo chmod +x /usr/sbin/zenoh_router


cat << EOF3 | sudo tee /etc/systemd/system/zenoh_router.service
[Unit]
Description=zenoh router
After=rmf_docker_container.target
[Service]
Type=simple
ExecStart=/bin/bash /usr/sbin/zenoh_router
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable zenoh_router.service