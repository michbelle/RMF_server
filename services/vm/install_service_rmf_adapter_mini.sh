cat << EOF2 | sudo tee /usr/sbin/rmf_adapter_mini
#!/bin/bash

source /opt/ros/jazzy/setup.bash
source /home/rmf_server/.bashrc
source /home/rmf_server/openRMF_ws/install/setup.bash
/opt/ros/jazzy/bin/ros2 launch rmf_server_elettra 1rmf_mini_fleet_adapter.launch.xml server_uri:="ws://localhost:8000/_internal"

EOF2

sudo chmod +x /usr/sbin/rmf_adapter_mini


cat << EOF3 | sudo tee /etc/systemd/system/rmf_adapter_mini.service
[Unit]
Description=rmf code
After=rmf_core.service
Wants=rmf_core.service
[Service]
Type=simple
Environment=RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
Environment=ROS_DOMAIN_ID=30
User=rmf_server
ExecStart=/bin/bash /usr/sbin/rmf_adapter_mini
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable rmf_adapter_mini.service