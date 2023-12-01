# NTP-Clock
NTP Clock Build on Alpine Linux on Raspberry Pi as seen in YouTube Video: https://youtu.be/HuaH8NzWg48
[![Link to NTP Clock Build on Linux youtube video](https://img.youtube.com/vi/HuaH8NzWg48/0.jpg)](https://youtu.be/HuaH8NzWg48)

## To Install NTP-Clock:
- Install Alpine Linux on a Raspberry Pi following instructions in this YouTube Video: https://youtu.be/jhtXjLUZB9g
  [![Link to installation of Alpine Linux on Raspberry Pi youtube video](https://img.youtube.com/vi/jhtXjLUZB9g/0.jpg)](https://youtu.be/jhtXjLUZB9g)
- Download the NTP-Clock zip file, extract and run the installer
```
wget -O NTP-Clock.zip https://github.com/XtendedGreg/ntp-clock/archive/refs/heads/main.zip
unzip NTP-Clock.zip
cd ntp-clock-main
chmod +x ntp-clock-install.sh
./ntp-clock-install.sh
```
- Change the configuration file ```vi /etc/ntp-clock/ntp-clock.conf```
  - Press "i" to edit the file (INSERT should be shown on the bottom left)
  - Change the timezone to your timezone
  - Update the location to be your location
    - City
    - Region
    - Latitude
    - Longitude
  - Hit the ESC key to exit edit mode
  - Type ":wq" to write the changes and quit the editor
- Restart the ntp-clock process ```/etc/init.d/ntp-clock restart```
- Once you have confirmed that the clock starts and runs successfully, save the changes to persist past reboots ```lbu commit -d```
- Restart the Raspberry Pi ```restart```

Following the installation procedure, the clock should boot and display the clock with the correct time automatically.

## Features
- The clock is designed to sync to NTP time automatically on boot and offset for the configured timezone automatically.
- The location information is used to compute the sunrise and sunset time using the astral python package locally on the Pi.
  - This will change the color of the clock text to a darker color at night to prevent eye strain.
- The installation script can be run multiple times to restore the installation defaults or to upgrade as needed.
