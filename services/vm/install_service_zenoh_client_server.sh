cat << EOF2 | sudo tee /usr/sbin/zenoh_client_server
#!/bin/bash

/home/rmf_server/RMF_server/src/rmf_server_elettra/zenoh/zenoh-bridge-ros2dds -c /home/rmf_server/RMF_server/src/rmf_server_elettra/zenoh/zenoh_config_server/server_config.json5

EOF2

sudo chmod +x /usr/sbin/zenoh_client_server


cat << EOF3 | sudo tee /etc/systemd/system/zenoh_client_server.service
[Unit]
Description=zenoh router
After=zenoh_router.service
Wants=zenoh_router.service

[Service]
Type=simple
Environment=RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
Environment=ROS_DOMAIN_ID=30
User=rmf_server
ExecStart=/bin/bash /usr/sbin/zenoh_client_server
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable zenoh_client_server.service