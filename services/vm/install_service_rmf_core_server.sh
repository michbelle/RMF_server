cat << EOF2 | sudo tee /usr/sbin/rmf_core
#!/bin/bash

source /opt/ros/jazzy/setup.bash
source /home/rmf_server/.bashrc
source /home/rmf_server/openRMF_ws/install/setup.bash
/opt/ros/jazzy/bin/ros2 launch rmf_server_elettra 0_rmf_core.launch.xml 

EOF2

sudo chmod +x /usr/sbin/rmf_core


cat << EOF3 | sudo tee /etc/systemd/system/rmf_core.service
[Unit]
Description=zenoh router
After=rmf_api_dash_server.target
Wants=rmf_api_dash_server.target

[Service]
Type=simple
Environment=RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
Environment=ROS_DOMAIN_ID=30
User=rmf_server
ExecStart=/bin/bash /usr/sbin/rmf_core
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable rmf_core.service