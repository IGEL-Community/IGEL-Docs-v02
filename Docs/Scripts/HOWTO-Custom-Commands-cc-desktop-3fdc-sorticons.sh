#!/bin/bash
#set -x
#trap read debug

#
# Version: 
# Sort Desktop Icons
#
# Custom Commands: Desktop: Final Desktop Command
#

# set up logging function
ACTION="sort_icons"
function log {
    logger -it "$ACTION" "$1"
}

# function to sort icons
function sort_icons {
    # iterate over each .desktop file in the directory
    for file in "$desktop_dir"/*.desktop; do
        # extract the file name without numeric prefix
        file_name="$(basename $file .desktop | sed 's/^[0-9]*_//')"
        # read the session name from the .desktop file
        session_name="$(grep -Po "(?<=^Name=).*" $file | sed -e 's/ /_/g')"
        # extract the app name from the file name
        app_name="$(echo $file_name | sed 's/_[0-9]*$//')"
        # extract the session ID from the filename
        session_id="$(basename $file .desktop | grep -Po "\d+$")"
        # construct the new filename based on the sorting format
        if [ "$sorting_format" -eq 1 ]; then
            new_filename="${session_name}_${app_name}_${session_id}.desktop"
        elif [ "$sorting_format" -eq 2 ]; then
            new_filename="${app_name}_${session_name}_${session_id}.desktop"
        else
            log "Invalid sorting format specified. Exiting."
            exit 1
        fi
        # check if the filename is already in the correct format
        if [[ ! "$file" =~ "${session_name}" ]]; then
            if [[ "$file" =~ "cwa" ]]; then
                log "Skipping ${file##*/} as cwa shortcuts should not be renamed"
            else
                # rename the .desktop file
                mv "$file" "$desktop_dir/$new_filename"
                log "Renamed ${file##*/} to $new_filename"
            fi
        else
            log "Skipping ${file##*/} as it is already in the correct format"
        fi
    done
}

log "Starting sort_icons script"

# define the directory containing the .desktop files
desktop_dir="/userhome/Desktop"

# specify the sorting format:
# set to 1 for "sessionname_appname_sessionid.desktop"
# set to 2 for "appname_sessionname_sessionid.desktop"
sorting_format=1

# execute the sorting function at the start of the script
sort_icons

# monitor for changes in the directory
while inotifywait -qq -e create -e modify -e delete "$desktop_dir"; do
    # execute the sorting function inside the loop
    sort_icons
done