# NTP-Clock
NTP Clock Build on Alpine Linux on Raspberry Pi as seen in YouTube Video: https://youtu.be/HuaH8NzWg48

#To Install NTP-Clock:
- Install Alpine Linux on a Raspberry Pi following instructions in this YouTube Video: https://youtu.be/jhtXjLUZB9g
- Download the NTP-Clock Zip File
- Copy the Zip File to the /root directory of the Raspberry Pi
- Unzip the zip file using the command "unzip NTP-Clock.zip"
- Add executable permissions to install script using command "chmod +x ntp-clock-install.sh"
- Run the install script using command "./ntp-clock-install.sh"
- Change the configuration file using command "vi /etc/ntp-clock/ntp-clock.conf"
  - Press "i" to edit the file (INSERT should be shown on the bottom left)
  - Change the timezone to your timezone
  - Update the location to be your location
    - City
    - Region
    - Latitude
    - Longitude
  - Hit the ESC key to exit edit mode
  - Type ":wq" to write the changes and quit the editor
- Restart the ntp-clock process using the command "/etc/init.d/ntp-clock restart"
- Once you have confirmed that the clock starts and runs successfully, save the changes using the command "lbu commit"
- Restart the Raspberry Pi using the command "restart"

Following the installation procedure, the clock should boot and display the clock with the correct time automatically.

#Features
- The clock is designed to sync to NTP time automatically on boot and offset for the configured timezone automatically.
- The location information is used to compute the sunrise and sunset time using the astral python package locally on the Pi.
  - This will change the color of the clock text to a darker color at night to prevent eye strain.
- The installation script can be run multiple times to restore the installation defaults or to upgrade as needed.
  - WARNING: Running the script again will not preserve any changes to the config file.  Backup the /etc/ntp-clock/ntp-clock.conf config before re-running the installer.
