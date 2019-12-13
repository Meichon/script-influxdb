#!/bin/bash
touch /etc/yum.repos.d/influxdb.repo
echo [influxdb] >> /etc/yum.repos.d/influxdb.repo
echo name = InfluxDB Repository - RHEL \$releasever >> /etc/yum.repos.d/influxdb.repo
echo baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable >> /etc/yum.repos.d/influxdb.repo
echo enabled = 1 >> /etc/yum.repos.d/influxdb.repo
echo gpgcheck = 1 >> /etc/yum.repos.d/influxdb.repo
echo gpgkey = https://repos.influxdata.com/influxdb.key >> /etc/yum.repos.d/influxdb.repo
repolist >> /dev/null
sudo yum install influxdb >> /dev/null
sudo service influxdb start >> /dev/null
read -n 1 -p "la Instalacion de influx ya finalizo, apreta una tecla para continuar"

