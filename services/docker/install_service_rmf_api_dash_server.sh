
cat << EOF2 | sudo tee /usr/sbin/rmf_api_dash_server
#!/bin/bash
export path_repo=/home/michelebelletti/open_RMF_server/
docker compose -f $path_repo/RMF_server/Docker_f/dockerCompose_api_dashboard/compose.yml up 
EOF2

sudo chmod +x /usr/sbin/rmf_api_dash_server_down

cat << EOF2 | sudo tee /usr/sbin/rmf_api_dash_server_down
#!/bin/bash
export path_repo=/home/michelebelletti/open_RMF_server/
docker compose -f $path_repo/RMF_server/Docker_f/dockerCompose_api_dashboard/compose.yml down 
EOF2

sudo chmod +x /usr/sbin/rmf_api_dash_server

cat << EOF3 | sudo tee /etc/systemd/system/rmf_api_dash_server.service
[Unit]
Description=zenoh router
Requires=docker.service
After=docker.service
[Service]
Type=simple
ExecStart=/bin/bash /usr/sbin/rmf_api_dash_server
ExecStop=/bin/bash /usr/sbin/rmf_api_dash_server_down
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target
EOF3

sudo systemctl enable rmf_api_dash_server.service