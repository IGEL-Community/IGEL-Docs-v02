#Set the script as Custom Command, Final Network
#Device attribute in the UMS Provide (bootPassword) Override rule Device 
#Variable in the profile ($CURRENTBIOSPASSWD) with the BIOS password
#view logged messages
#journalctl | grep set-boot-pw
#Eike Schwoeppe
#braincon GmbH
#02.07.2024
#IGEL Community rocks#

cat << 'EOF' > /tmp/set-boot-pw
#!/bin/bash
#Logging action
ACTION="set-boot-pw_${1}"
#output to systemlog with ID and tag
LOGGER="logger -it ${ACTION}"
#Starting script
$LOGGER "Starting"
bootPassword="$(rmagent-devattrs-get bootPassword)"
if [ "$bootPassword" = "" ] ; then

    $LOGGER "Create Password"
    BOOTPASSWD=$(tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 10)
    $LOGGER "Password Created"
    $LOGGER "Set Bootpassword as Variable and send to UMS"
    rmagent-devattrs-set bootPassword $BOOTPASSWD
    $LOGGER "Sync Password to UMS"
    result="$(rmagent-devattrs-sync)"
    if [ "$result" = "Successfully synced." ] ; then
            $LOGGER "Successfully synced."
        else
            $LOGGER "Failed to Sync. Exit Script without setting Bootpassword."
            exit 0
    fi
    $LOGGER "BIOS Authentication"
    #Die Variable $CURRENTBIOSPASSWD sollte kein klartext sein.
    sudo echo $CURRENTBIOSPASSWD > /sys/class/firmware-attributes/thinklmi/authentication/Admin/current_password
    sudo echo ascii > /sys/class/firmware-attributes/thinklmi/authentication/Admin/encoding
    $LOGGER "Set Bootpassword"
    sudo echo $BOOTPASSWD > /sys/class/firmware-attributes/thinklmi/authentication/Power-on/new_password
    $LOGGER "Clear Variables"
    unset BOOTPASSWD
    exit 0
fi
$LOGGER "End"
exit 0
EOF
chmod +x /tmp/set-boot-pw
setsid /tmp/set-boot-pw &