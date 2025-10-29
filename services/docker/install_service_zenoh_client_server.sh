cat << EOF2 | sudo tee /usr/sbin/zenoh_client_server
#!/bin/bash

docker exec -i --user ros rmf_server_elettra  bash -c "source /opt/ros/jazzy/setup.bash && source /home/ros/.bashrc && /openRMF_ws/src/rmf_server_elettra/zenoh/zenoh-bridge-ros2dds -c /openRMF_ws/src/rmf_server_elettra/zenoh/zenoh_config_server/server_config.json5"

EOF2

sudo chmod +x /usr/sbin/zenoh_client_server


cat << EOF3 | sudo tee /etc/systemd/system/zenoh_client_server.service
[Unit]
Description=zenoh router
After=zenoh_router.target
Wants=zenoh_router.target
[Service]
Type=simple
ExecStart=/bin/bash /usr/sbin/zenoh_client_server
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable zenoh_client_server.service