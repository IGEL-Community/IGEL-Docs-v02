#!/bin/bash
#set -x
#trap read debug

#
# Version: 
# Set Permissions on /var/www/webdav
#
# Custom Commands: Desktop: Final Desktop Command
#

# set up logging function
ACTION="apache2_set_permissions"
function log {
    logger -it "$ACTION" "$1"
}

log "Starting $ACTION"
chown -R www-data:www-data /services_rw/apache/var/www/webdav
chmod -R 775 /var/www/webdav/* /services_rw/apache/var/www/webdav
log "Ending $ACTION"

