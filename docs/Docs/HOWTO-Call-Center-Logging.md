# HOWTO Call Center Logging

Call centers have a requirement for logging of screen captures and audio during a session.

The call center applications may have limited functionality or complex setup requirements.

IGEL OS can be configured to capture the audio and screen shots outside of the call center applications.

-----

-----

## Applications to setup

- Audio: Pipewire `pw-cat` built into IGEL OS 12
- Screen Shot Tool: `scrot` via IGEL Community GitHub App Recipe [scrot](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Apps/scrot)
- Compress Audio WAV file: `ffmpeg` via IGEL Community GitHub App Recipe [ffmpeg](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Apps/ffmpeg)


-----

-----

## Call Center Logging Script

Example script that can be started as part of the call center application start-up. For this example, the script is run with native Cisco Webex client. IGEL Community on GitHub App Recipe [Webex](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Unified_Communications/webex)

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# call-center-logging.sh
#
# Record audio pw-cat
# Screen captures at x seconds

#
# Applications used
#
# pw-cat - pipewire built into IGEL OS12
# scrot - screen shot tools - App Creator Recipe on GitHub
# ffmpeg - compress audio wav files into mp3 - App Creator Recipe on GitHub
#

FILE_PATH=/tmp/$(hostname)_$(date +%y%m%d%H%M%S)
AUDIO_FILE=$(hostname)_$(date +%y%m%d%H%M%S)
SCROT_BASENAME=$(hostname)
SCROT_QUALITY=1
SCREENSHOT_SLEEP=10
# Reduce audio file size by changing sample rate from 48000 to 6000
SAMPLE_RATE=6000
VOLUME=1.5
# Name of the process to check
# Cisco Webex
PROCESS_NAME="CiscoCollabHost"

# No changes needed below this line

# create folder
if [ ! -d ${FILE_PATH} ]; then
  mkdir -p ${FILE_PATH}
fi

cd ${FILE_PATH}

# start audio recording
pw-cat --record --rate=${SAMPLE_RATE} --volume=${VOLUME} ${AUDIO_FILE}.wav &

# take first screen shot and sleep
# scrot has settings to reduce image size - q num (1-100)
scrot -q ${SCROT_QUALITY} ${SCROT_BASENAME}_$(date +%y%m%d%H%M%S).png
sleep ${SCREENSHOT_SLEEP}

# Loop until the process is no longer running
while pgrep -x "$PROCESS_NAME" > /dev/null; do
  scrot -q ${SCROT_QUALITY} ${SCROT_BASENAME}_$(date +%y%m%d%H%M%S).png
  #echo "Press [CTRL+C] to stop.."
  sleep ${SCREENSHOT_SLEEP}
done

# Stop the pw-cat audio recording
pkill pw-cat

# Compress and remove WAV file
ffmpeg -i ${AUDIO_FILE}.wav ${AUDIO_FILE}.mp3
rm ${AUDIO_FILE}.wav

# zip up the session
zip -r /tmp/call_center_recording_$(hostname)_$(date +%y%m%d%H%M%S).zip ${FILE_PATH}
cd /tmp
rm -rf ${FILE_PATH}
```

-----

-----

## Items left to work on

- Method for moving the zipped sessions to a central server