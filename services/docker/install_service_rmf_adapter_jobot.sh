cat << EOF2 | sudo tee /usr/sbin/rmf_adapter_jobot
#!/bin/bash

docker exec -i --user ros rmf_server_elettra  bash -c "source /opt/ros/jazzy/setup.bash && source /home/ros/.bashrc && source /openRMF_ws/install/setup.bash && /opt/ros/jazzy/bin/ros2 launch rmf_server_elettra 1rmf_jobot_fleet_adapter.launch.xml server_uri:='ws://localhost:8000/_internal'"

EOF2

sudo chmod +x /usr/sbin/rmf_adapter_jobot


cat << EOF3 | sudo tee /etc/systemd/system/rmf_adapter_jobot.service
[Unit]
Description=rmf code
After=rmf_core.service
Wants=rmf_core.service
[Service]
Type=simple
ExecStart=/bin/bash /usr/sbin/rmf_adapter_jobot
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable rmf_adapter_jobot.service