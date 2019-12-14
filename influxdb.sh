#!/bin/bash
distro=$(cat /etc/*release | awk '{print $1}' | head -1)
repo=$( /etc/yum.repos.d/* | grep influx >> /dev/null)

clear

if [ $distro==Centos ];then
x=$(cat /etc/*release | awk '{print $1}' | head -1)
echo "la didtro es, $x"
ls -l /etc/yum.repos.d/* | grep influx >> /dev/null


        if [ $? -eq 1 ]; then
        touch /etc/yum.repos.d/influxdb.repo
        echo [influxdb] >> /etc/yum.repos.d/influxdb.repo
        echo name = InfluxDB Repository - RHEL \$releasever >> /etc/yum.repos.d/influxdb.repo
        echo baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable >> /etc/yum.repos.d/influxdb.repo
        echo enabled = 1 >> /etc/yum.repos.d/influxdb.repo
        echo gpgcheck = 1 >> /etc/yum.repos.d/influxdb.repo
        echo gpgkey = https://repos.influxdata.com/influxdb.key >> /etc/yum.repos.d/influxdb.repo


        fi
fi
if [ $distro==Oracle ];then
x=$( cat /etc/*release | head -1 )
echo "la didtro es $x"
ls -l /etc/yum.repos.d/* | grep public-yum-ol6.repo >> /dev/null


        if [ $? -eq 1 ]; then
yum install wget -y >> /dev/null
wget http://public-yum.oracle.com/public-yum-ol6.repo
sed -i 's/enabled=0/enabled=1/g' public-yum-ol6.repo
yum repolist
#instalacion y configuracion ssl(por problemas l reconocer la  llave publica instalar el repositorio de influxdb
yum -y install ca-certificates openssl nss
#instalacion y configuracion de repo 
cd /etc/yum.repos.d
touch influxdb.repo
echo [influxdb] >> influxdb.repo
echo name = InfluxDB Repository - RHEL \$releasever >> influxdb.repo
echo baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable >> influxdb.repo
echo enabled = 1 >> influxdb.repo
echo gpgcheck = 1 >> influxdb.repo
echo gpgkey = https://repos.influxdata.com/influxdb.key >> influxdb.repo
        else
        read -n 1 -p "el repo ya existe"
        fi

fi

