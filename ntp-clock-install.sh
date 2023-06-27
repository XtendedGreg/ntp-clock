#!/bin/ash
# ntp-clock Installation Script
# Created by: XtendedGreg 6-21-2023

echo "NTP-Clock Starting Installation..."

# Uncomment community entry in APK repositories file
sed -i '/community/s/^# *//' /etc/apk/repositories

# Install Required Packages
apk update
apk add python3 py3-pip
apk add build-base python3-dev linux-headers
pip3 install pytz colored cursor astral netifaces
apk del build-base python3-dev linux-headers

# Copy Files
cp ./root/bin/ntp-clock /bin/ntp-clock
cp ./root/bin/ntp_clock_numbers.py /bin/ntp_clock_numbers.py
cp ./root/etc/init.d/ntp-clock /etc/init.d/ntp-clock
mkdir -p /etc/ntp-clock
cp ./root/etc/ntp-clock/ntp-clock.conf /etc/ntp-clock/ntp-clock.conf
cp ./root/etc/motd /etc/motd
cp ./root/root/example_usercfg.txt /root/example_usercfg.txt

lbu add /bin/ntp-clock
lbu add /bin/ntp_clock_numbers.py
lbu add /etc/init.d/ntp-clock
lbu add /usr/lib/python3*/site-packages/*
lbu add /root/example_usercfg.txt

chmod +x /bin/ntp-clock
chmod +x /bin/ntp_clock_numbers.py
chmod +x /etc/init.d/ntp-clock

rc-update add ntp-clock default

lbu commit

echo "NTP-Clock Installation Complete.  Starting Clock..."

/etc/init.d/ntp-clock start || /etc/init.d/ntp-clock restart
