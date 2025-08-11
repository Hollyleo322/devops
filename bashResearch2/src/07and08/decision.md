## Установка prometheus
`sudo apt install prometheus`
## Установка пользователя для запуска node_exporter
`sudo useradd --no-create-home --shell /bin/false node_exporter`
## Создание unit file systemd
`sudo systemctl edit --full --force node_exporter.service`

[Unit]

Description=Prometheus Node Exporter

Wants=network-online.target

After=network-online.target

[Service]

User=node_exporter

Group=node_exporter

Type=simple

ExecStart=/usr/bin/prometheu-node-exporter

[Install]

WantedBy=multi-user.target

## Установка grafana
1. `sudo apt-get install -y adduser libfontconfig1 musl`
2. `wget https://dl.grafana.com/oss/release/grafana_10.2.3_amd64.deb`
3. `sudo dpkg -i grafana_10.2.3_amd64.deb`
4. `sudo /bin/systemctl daemon-reload`
5. `sudo /bin/systemctl enable grafana-server`
6. `sudo /bin/systemctl start grafana-server`