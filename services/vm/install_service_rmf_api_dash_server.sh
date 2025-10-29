
cat << EOF2 | sudo tee /usr/sbin/rmf_api_dash_server
#!/bin/bash

/opt/ros/jazzy/bin/ros2 launch rmf_server_elettra 0_rmf_api_dash_server.launch.xml 

EOF2

sudo chmod +x /usr/sbin/rmf_api_dash_server


cat << EOF3 | sudo tee /etc/systemd/system/rmf_api_dash_server.service
[Unit]
Description=zenoh router
After=zenoh_client_server.target
Wants=zenoh_client_server.target
[Service]
Type=simple
Environment=RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
Environment=ROS_DOMAIN_ID=30
User=rmf_server
ExecStart=/bin/bash /usr/sbin/rmf_api_dash_server
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable rmf_api_dash_server.service