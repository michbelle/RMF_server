cat << EOF2 | sudo tee /usr/sbin/rmf_core
#!/bin/bash

docker exec -i --user ros rmf_server_elettra  bash -c "source /opt/ros/jazzy/setup.bash && source /home/ros/.bashrc && source /openRMF_ws/install/setup.bash && /opt/ros/jazzy/bin/ros2 launch rmf_server_elettra 0_rmf_core.launch.xml"

EOF2

sudo chmod +x /usr/sbin/rmf_core


cat << EOF3 | sudo tee /etc/systemd/system/rmf_core.service
[Unit]
Description=rmf code
After=zenoh_client_server.service
Wants=zenoh_client_server.service
[Service]
Type=simple
ExecStart=/bin/bash /usr/sbin/rmf_core
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable rmf_core.service