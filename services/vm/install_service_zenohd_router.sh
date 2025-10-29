cat << EOF2 | sudo tee /usr/sbin/zenoh_router
#!/bin/bash

/usr/bin/zenohd

EOF2

sudo chmod +x /usr/sbin/zenoh_router


cat << EOF3 | sudo tee /etc/systemd/system/zenoh_router.service
[Unit]
Description=zenoh router

[Service]
Type=simple
Environment=RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
Environment=ROS_DOMAIN_ID=30
User=rmf_server
ExecStart=/bin/bash /usr/sbin/zenoh_router
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable zenoh_router.service