cat << EOF2 | sudo tee /usr/sbin/rmf_docker_container
#!/bin/bash

/usr/bin/docker rmf_server_elettra

EOF2

sudo chmod +x /usr/sbin/rmf_docker_container


cat << EOF3 | sudo tee /etc/systemd/system/rmf_docker_container.service
[Unit]
Description=zenoh router
Requires=docker.service
After=docker.service
After=rmf_api_dash_server.service
[Service]
Type=simple
ExecStart=/bin/bash /usr/sbin/rmf_docker_container
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable rmf_docker_container.service