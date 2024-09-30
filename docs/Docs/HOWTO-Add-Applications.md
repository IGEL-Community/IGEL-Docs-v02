# HOWTO Add Applications

-----

## OS 11 and  OS 12 Via Custom Partitions

[IGEL Community on GitHub - Custom Partitions](https://github.com/IGEL-Community/IGEL-Custom-Partitions)

### Sample OS 11 Profiles to test some of the most common Custom Partitions created by the automated builder scripts on GitHub link above.

| Application | Profile |
|-------------|---------|
| Chrome | <a href="../Profiles/HOWTO-Add-Application-Chrome-CP-profile.xml" download>LINK to Profile</a> |
| Frame | <a href="../Profiles/HOWTO-Add-Application-Frame-CP-profile.xml" download>LINK to Profile</a> |
| LibreOffice | <a href="../Profiles/HOWTO-Add-Application-LibreOffice-CP-profile.xml" download>LINK to Profile</a> |
| Microsoft Edge | <a href="../Profiles/HOWTO-Add-Application-Microsoft-Edge-CP-profile.xml" download>LINK to Profile</a> |
| VLC | <a href="../Profiles/HOWTO-Add-Application-VLC-CP-profile.xml" download>LINK to Profile</a> |
| Webex | <a href="../Profiles/HOWTO-Add-Application-Webex-CP-profile.xml" download>LINK to Profile</a> |
| Zoom | <a href="../Profiles/HOWTO-Add-Application-Zoom-CP-profile.xml" download>LINK to Profile</a> |

### OS 12 Profile Settings

| Application | Size | URL | Initial action | Final Action | Icon | Command |
|-------------|------|-----|----------------|--------------|------|---------|
| Chrome | 600M | https://[UMS_Server]:8443/ums_filetransfer/chrome.inf | /custom/chrome-cp-init-script.sh init | /custom/chrome-cp-init-script.sh stop | /custom/chrome/opt/google/chrome/product_logo_256.png | /custom/chrome/usr/bin/google-chrome-stable |
| Frame | 500M | https://[UMS_Server]:8443/ums_filetransfer/frame.inf | /custom/frame-cp-init-script.sh init | /custom/frame-cp-init-script.sh stop | /custom/frame/usr/share/pixmaps/Frame.png | /custom/frame/usr/bin/nutanix-frame/Frame –url=console.nutanix.com |
| LibreOffice | 1500M | https://[UMS_Server]:8443/ums_filetransfer/libreoffice.inf | /custom/libreoffice-cp-init-script.sh init | /custom/libreoffice-cp-init-script.sh stop | /custom/libreoffice/usr/share/icons/hicolor/256x256/apps/libreoffice7.5-main.png | /custom/libreoffice/opt/libreoffice7.5/program/soffice |
| Microsoft Edge | 800M | https://[UMS_Server]:8443/ums_filetransfer/edge.inf | /custom/edge-cp-init-script.sh init | /custom/edge-cp-init-script.sh stop | /custom/edge/opt/microsoft/msedge-beta/product_logo_256_beta.png | /custom/edge/usr/bin/microsoft-edge-beta |
| VLC | 300M | https://[UMS_Server]:8443/ums_filetransfer/vlc.inf | /custom/vlc-cp-init-script.sh init | /custom/vlc-cp-init-script.sh stop | /custom/vlc/usr/share/icons/hicolor/256x256/apps/vlc.png | /custom/vlc/usr/bin/vlc |
| Webex | 1100M | https://[UMS_Server]:8443/ums_filetransfer/webex.inf | /custom/webex-cp-init-script.sh init | /custom/webex-cp-init-script.sh stop | /custom/webex/opt/Webex/bin/sparklogosmall.png | /custom/webex/opt/Webex/bin/CiscoCollabHost |
| Zoom | 800M | https://[UMS_Server]:8443/ums_filetransfer/zoom.inf | /custom/zoom-cp-init-script.sh init | /custom/zoom-cp-init-script.sh stop | /custom/zoom/usr/share/pixmaps/Zoom.png | xdg-mime default Zoom.desktop x-scheme-handler/zoommtg && /custom/zoom/usr/bin/zoom |

### IGEL Disclaimer

The provided packages for use with the IGEL OS Custom Partition feature are without any warranty or support by IGEL Technology.

The files are not designed for production usage, use at your own risk. IGEL Technology will not provide any packages for production use and will not create or support any other packages or the implementation for other 3rd party software.

IGEL Technology is not responsible for any license violation created with the custom partition technology or the provided technical demonstation packages.

The custom partition technology can create a permanent damage in the IGEL OS host system, services related to the wrong usage/misinstallation of a custom partition and/or the deployed packages are not covered by the warranty in any kind.

You will not get support as long the custom partition is used on a system, to avoid conflicts you've to reset the device back to factory defaults before opening a support call.

All packages are designed as technical demonstration samples!

Use at your own risk! 

-----

## [OS 12 App Portal](https://kb.igel.com/en/how-to-start-with-igel/current/igel-app-portal)

- With IGEL OS 12, the modular principle is introduced – you can install and update single applications like Citrix or AVD client, Chromium browser, etc. individually. All applications currently available for IGEL OS 12 can be found in the IGEL App Portal. 

-----

## OS 12 App SDK (Coming soon)

Build your own IGEL OS App with IGEL OS App SDK.

- [IGEL App Creator Portal – the straightforward way to secure and deploy your third-party apps to IGEL OS12](https://www.igel.com/blog/igel-app-creator-portal-the-straightforward-way-to-secure-and-deploy-your-third-party-apps-to-igel-os12/)
- [IGEL KB: IGEL App Creator Portal](https://kb.igel.com/igel-app-creator/current/igel-app-creator-portal)
- [IGEL Community GitHub: IGEL OS APP RECIPES](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES)

**Please Note:** Currently, for security requirements, the IGEL App Creator Portal only allows for debian and ubuntu official repository URLs. IGEL is planning to allow for non-official URLs with a future release.

-----

## Do you have a UD Pocket with IGEL OS 12 from Disrupt?

## Want to test out OS 12 with App Portal without UMS12?

### [Video show steps to add applications to OS 12 without UMS12](https://raw.githubusercontent.com/IGEL-Community/IGEL-Docs-v02/main/docs/Docs/videos/HOWTO-Add-Applications-IGEL_OS_12_wo_UMS_AppPortal.mp4)

<video controls>
<source src="../videos/HOWTO-Add-Applications-IGEL_OS_12_wo_UMS_AppPortal.mp4" type="video/mp4">
</video>

Here are some steps to try out

Steps to test out your UDPocket or OS 12 installed device

- Boot device
- Skip -- Let's connect to the company network
- Skip -- Use the one-time password to onboard this device?
- Obtain IGEL OS 12 Evaluation License -- Are you implementing as IGEL solution for your company? (This is 90 a day day evaluation license)
- Reboot
- Open the App Portal and install applications

### Optional - Use igelpkgctl command line

- Open a Terminal Window as root (add terminal session from setup)

- List packages to install:

```bash linenums="1"
igelpkgctl list
```

- Update to latest version of IGEL OS

```bash linenums="1"
igelpkgctl install base_system
```

- Install lastest AVD client:

```bash linenums="1"
igelpkgctl install avd
```

- Open Setup to add a AVD session: ++ctrl+alt+s++ 

- Install lastest Chromium client:

```bash linenums="1"
igelpkgctl install chromium
```

- Open Setup to add a Chromium session: ++ctrl+alt+s++ 

[Options for igelpkgctl](https://igel-community.github.io/IGEL-Docs-v02/Docs/Cheatsheet-IGELCommunity/?h=igelpkgctl#igelos-12-packages-igelpkgctl)


### Optional - How to reset a device

Run the following command as root in terminal window:

```bash linenums="1"
mount -o remount,rw /license && rm -rf /license/dsa/licenses/*.lic && reset_to_defaults && reboot
```
Or (new command with OS 12 - `delete_igel_licenses ALL`)
```bash linenums="1"
delete_igel_licenses ALL && reset_to_defaults && reboot
```

-----

## Steps to connect an OS 12 device to sandbox UMS

Steps to test out your UDPocket or OS 12 installed device with a sandbox UMS

- Boot device
- Skip -- Let's connect to the company network
- Use the one-time password to onboard this device?
    - URL / Server address: `73.242.149.67`
    - Port: `8443`
    - One-time password: `TRY-IGEL`
    - Communication token: `94ad777f5b5894a7`

[IGEL KB: Alternative Onboarding Method: Registering Devices with the UMS Using the One-Time Password](https://kb.igel.com/en/how-to-start-with-igel/current/onboarding-igel-os-12-devices#OnboardingIGELOS12Devices-RegisterOS12devices_OTPAlternativeOnboardingMethod:RegisteringDeviceswiththeUMSUsingtheOne-TimePassword)

-----

## GitHub Custom Partition Builders - Where the Magic Happens

The GitHub site for Custom Partitions (CP) uses build script to automate the creation of a CP.

- [IGEL Community - GitHub Custom Partition site](https://github.com/IGEL-Community/IGEL-Custom-Partitions)

There are videos in the link above showing steps to create a CP. In summary the steps are:

- Create Ubuntu VM (18.04 for pre OS 11.09, 22.04 for OS 11.09+/10+, and 20.04 for OS 12)
- Get the builder script from GitHub and run it on the VM
- Copy the CP to UMS / File server  (importing, `.inf`, `.tar.bz2`, `.xml`)
- Update the UMS CP profile for file server name and file location
- Assign profile to devices

**NOTE:** As of 5 May, 2024 IGEL OS pre 11.09 uses Ubuntu 18.04 libraries, OS 11.09+/10+ users Ubuntu 22.04 libraries, and IGEL OS 12 uses Ubuntu 20.04 libraries. To check the OS version:

```bash linenums="1"
cat /etc/os-release | grep "^VERSION_ID"
```

### Debugging Custom Partition

- **Q:** What log should be checked for failed CP deployment?
- **A:** Here is command to find custom:

```bash linenums="1"
journalctl | grep -i custom
```

### VLC Media Player  - Build Script

The [VLC Media Player CP](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Apps/VLC) can build a CP for either OS 11 or OS 12.

Let us take a look at the build script [build-vlc-cp.sh](https://github.com/IGEL-Community/IGEL-Custom-Partitions/blob/master/CP_Source/Apps/VLC/build/build-vlc-cp.sh)

- **Lines: 2-3** `set -x` will show each line as executed. `trap read debug` will single step the script and will require ++return++ key pressed to move to next line. Remove the `#` for debugging script.

- **Lines: 7-19** Variables used in the script. `Lines: 18-19` are the dependent libraries and were obtained by starting an install of `VLC`. `gdebi` can be used for finding dependencies on a `.deb` file.

- **Lines: 60-74** VLC has many dependencies that may or may not be included in IGEL OS 11 or 12. The builder adds all the dependencies and this section of the script prunes out any dependencies that are in the target OS version as defined by `OS11_CLEAN` or `OS12_CLEAN`. Additional details can be found [GitHub Usr Clean](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/utils/igelos_usr)

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

# Creating an IGELOS CP
## Development machine Ubuntu (pre OS11.09 = 18.04; OS11.09+ = 22.04; OS12 = 20.04)
CP="vlc"
ZIP_LOC="https://github.com/IGEL-Community/IGEL-Custom-Partitions/raw/master/CP_Packages/Apps"
ZIP_FILE="VLC"
FIX_MIME="TRUE"
CLEAN="TRUE"
OS11_CLEAN="11.07.100"
OS12_CLEAN="12.01.100"
USERHOME_FOLDERS="TRUE"
USERHOME_FOLDERS_DIRS="custom/${CP}/userhome/.config/${CP} custom/${CP}/userhome/.local/share/${CP}"
APPARMOR="TRUE"
GETVERSION_FILE="../../${CP}_*amd64.deb"
MISSING_LIBS_OS11="i965-va-driver liba52-0.7.4 libaacs0 libaribb24-0 libass9 libavcodec57 libavformat57 libavutil55 libbasicusageenvironment1 libbdplus0 libbluray2 libcddb2 libchromaprint1 libcrystalhd3 libdc1394-22 libdca0 libdouble-conversion1 libdvbpsi10 libdvdnav4 libdvdread4 libebml4v5 libfaad2 libgme0 libgroupsock8 libgsm1 libkate1 liblirc-client0 liblivemedia62 liblua5.2-0 libmad0 libmatroska6v5 libmicrodns0 libmpcdec6 libmpeg2-4 libnfs11 libopenjp2-7 libopenmpt-modplug1 libopenmpt0 libplacebo4 libpostproc54 libprotobuf-lite10 libproxy-tools libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5svg5 libqt5widgets5 libqt5x11extras5 libresid-builder0c2a libsdl-image1.2 libsdl1.2debian libshine3 libsidplay2 libsnappy1v5 libsndio6.1 libsoxr0 libssh-gcrypt-4 libssh2-1 libswresample2 libswscale4 libupnp6 libusageenvironment3 libva-drm2 libva-wayland2 libva-x11-2 libva2 libvdpau1 libvlc-bin libvlc5 libvlccore9 libvulkan1 libx264-152 libx265-146 libxcb-xinerama0 libxvidcore4 libzvbi-common libzvbi0 mesa-va-drivers mesa-vdpau-drivers qt5-gtk-platformtheme qttranslations5-l10n va-driver-all vdpau-driver-all vlc vlc-bin vlc-data vlc-l10n vlc-plugin-base vlc-plugin-notify vlc-plugin-qt vlc-plugin-samba vlc-plugin-skins2 vlc-plugin-video-output vlc-plugin-video-splitter vlc-plugin-visualization"
MISSING_LIBS_OS12="i965-va-driver intel-media-va-driver liba52-0.7.4 libaacs0 libaom0 libaribb24-0 libass9 libavcodec58 libavformat58 libavutil56 libbasicusageenvironment1 libbdplus0 libbluray2 libcddb2 libchromaprint1 libcodec2-0.9 libdc1394-22 libdca0 libdouble-conversion3 libdvbpsi10 libdvdnav4 libdvdread7 libebml4v5 libfaad2 libgme0 libgroupsock8 libgsm1 libigdgmm11 libixml10 libkate1 liblirc-client0 liblivemedia77 liblua5.2-0 libmad0 libmatroska6v5 libmpcdec6 libmpeg2-4 libmysofa1 libopenmpt-modplug1 libopenmpt0 libpcre2-16-0 libplacebo7 libpostproc55 libprotobuf-lite17 libproxy-tools libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5svg5 libqt5widgets5 libqt5x11extras5 libresid-builder0c2a libsdl-image1.2 libsdl1.2debian libshine3 libsidplay2 libsnappy1v5 libsndio7.0 libspatialaudio0 libsrt1 libssh-gcrypt-4 libssh2-1 libswresample3 libswscale5 libupnp13 libusageenvironment3 libva-drm2 libva-wayland2 libva-x11-2 libva2 libvdpau1 libvlc-bin libvlc5 libvlccore9 libx264-155 libx265-179 libxcb-xinerama0 libxcb-xinput0 libxvidcore4 libzvbi-common libzvbi0 mesa-va-drivers mesa-vdpau-drivers ocl-icd-libopencl1 qt5-gtk-platformtheme qttranslations5-l10n va-driver-all vdpau-driver-all vlc vlc-bin vlc-data vlc-l10n vlc-plugin-base vlc-plugin-notify vlc-plugin-qt vlc-plugin-samba vlc-plugin-skins2 vlc-plugin-video-output vlc-plugin-video-splitter vlc-plugin-visualization"

VERSION_ID=$(grep "^VERSION_ID" /etc/os-release | cut -d "\"" -f 2)

if [ "${VERSION_ID}" = "18.04" ]; then
  MISSING_LIBS="${MISSING_LIBS_OS11}"
  IGELOS_ID="OS11"
elif [ "${VERSION_ID}" = "22.04" ]; then
  MISSING_LIBS="${MISSING_LIBS_OS11}"
  IGELOS_ID="OS11"
elif [ "${VERSION_ID}" = "20.04" ]; then
  MISSING_LIBS="${MISSING_LIBS_OS12}"
  IGELOS_ID="OS12"
else
  echo "Not a valid Ubuntu OS release. pre OS11.09 needs 18.04 (bionic), OS11.09+ needs 22.04 (jammy), and OS12 needs 20.04 (focal)."
  exit 1
fi

sudo apt install unzip -y

mkdir build_tar
cd build_tar

for lib in $MISSING_LIBS; do
  apt-get download $lib
done

mkdir -p custom/${CP}

find . -name "*.deb" | while read LINE
do
  dpkg -x "${LINE}" custom/${CP}
done

if [ "${FIX_MIME}" = "TRUE" ]; then
  mv custom/${CP}/usr/share/applications/ custom/${CP}/usr/share/applications.mime
fi

if [ "${USERHOME_FOLDERS}" = "TRUE" ]; then
  for folder in $USERHOME_FOLDERS_DIRS; do
    mkdir -p $folder
  done
fi

if [ "${CLEAN}" = "TRUE" ]; then
  echo "+++++++=======  STARTING CLEAN of USR =======+++++++"
  wget https://raw.githubusercontent.com/IGEL-Community/IGEL-Custom-Partitions/master/utils/igelos_usr/clean_cp_usr_lib.sh
  chmod a+x clean_cp_usr_lib.sh
  wget https://raw.githubusercontent.com/IGEL-Community/IGEL-Custom-Partitions/master/utils/igelos_usr/clean_cp_usr_share.sh
  chmod a+x clean_cp_usr_share.sh
  if [ "${IGELOS_ID}" = "OS11" ]; then
    ./clean_cp_usr_lib.sh ${OS11_CLEAN}_usr_lib.txt custom/${CP}/usr/lib
    ./clean_cp_usr_share.sh ${OS11_CLEAN}_usr_share.txt custom/${CP}/usr/share
  else
    ./clean_cp_usr_lib.sh ${OS12_CLEAN}_usr_lib.txt custom/${CP}/usr/lib
    ./clean_cp_usr_share.sh ${OS12_CLEAN}_usr_share.txt custom/${CP}/usr/share
  fi
  echo "+++++++=======  DONE CLEAN of USR =======+++++++"
fi

wget ${ZIP_LOC}/${ZIP_FILE}.zip

unzip ${ZIP_FILE}.zip -d custom

if [ "${APPARMOR}" = "TRUE" ]; then
  mkdir -p custom/${CP}/config/bin
  mkdir -p custom/${CP}/lib/systemd/system
  mv custom/target/build/${CP}_cp_apparmor_reload custom/${CP}/config/bin
  mv custom/target/build/igel-${CP}-cp-apparmor-reload.service custom/${CP}/lib/systemd/system/
fi
mv custom/target/build/${CP}-cp-init-script.sh custom

cd custom

# edit inf file for version number
mkdir getversion
cd getversion
ar -x ${GETVERSION_FILE}
tar xf control.tar.* ./control
VERSION=$(grep Version control | cut -d " " -f 2)
#echo "Version is: " ${VERSION}
cd ..
sed -i "/^version=/c version=\"${VERSION}\"" target/${CP}.inf
#echo "${CP}.inf file is:"
#cat target/${CP}.inf

# new build process into zip file
tar cvjf target/${CP}.tar.bz2 ${CP} ${CP}-cp-init-script.sh
zip -g ../${ZIP_FILE}.zip target/${CP}.tar.bz2 target/${CP}.inf
zip -d ../${ZIP_FILE}.zip "target/build/*" "target/igel/*" "target/target/*"
mv ../${ZIP_FILE}.zip ../../${ZIP_FILE}-${VERSION}_${IGELOS_ID}_igel01.zip

cd ../..
rm -rf build_tar
```

### VLC Media Player - CP init script

The `CP init script` runs after the CP files are deployed and before the CP files are removed. Many applications expect to be installed in predefined folders. The init script can be used to link the CP into the file system.

Let us take a look at the init script [vlc-cp-init-script.sh](https://github.com/IGEL-Community/IGEL-Custom-Partitions/blob/master/CP_Source/Apps/VLC/build/vlc-cp-init-script.sh)

- **Lines: 27-36** Link the files in the CP to the IGEL OS file system.

- **Lines: 48-52** Associate VLC for media file types.

- **Lines: 57-62** Unlink the files in the CP from the IGEL OS file system.

```bash linenums="1"
#! /bin/bash
#set -x
#trap read debug

ACTION="custompart-vlc_${1}"

# mount point path
MP=$(get custom_partition.mountpoint)

# custom partition path
CP="${MP}/vlc"

# userhome
VLC_CONFIG="/userhome/.config/vlc"
VLC_LOCAL="/userhome/.local/share/vlc"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

case "$1" in
init)
  # Initial permissions
  chown -R root:root "${CP}" | $LOGGER
  # Linking files and folders on proper path
  find ${CP} -printf "/%P\n" | while read DEST
  do
    if [ ! -z "${DEST}" -a ! -e "${DEST}" ]; then
      # Remove the last slash, if it is a dir
      [ -d $DEST ] && DEST=${DEST%/} | $LOGGER
      if [ ! -z "${DEST}" ]; then
        ln -sv "${CP}/${DEST}" "${DEST}" | $LOGGER
      fi
    fi
  done

  # basic persistency
  chown -R user:users "${CP}${VLC_CONFIG}"
  chown -R user:users "${CP}${VLC_LOCAL}"

  # Add apparmor profile to trust in Firefox to make SSO possible
  # We do this by a systemd service to run the reconfiguration
  # surely after apparmor.service!!!
  systemctl --no-block start igel-vlc-cp-apparmor-reload.service

  # after CP installation run wm_postsetup to activate mimetypes for SSO
  if [ -d /run/user/777 ]; then
    wm_postsetup
    # delay the CP ready notification
    sleep 3
  fi

;;
stop)
  # Unlinking files and folders on proper path
  find ${CP} -printf "/%P\n" | while read DEST
  do
    if [ -L "${DEST}" ]; then
      unlink $DEST | $LOGGER
    fi
  done

;;
esac

echo "Finished" | $LOGGER

exit 0
```

-----

## GitHub Custom Partition Builders - Automation

**Q:** How to keep applications up to date?

**A:** [CP build automation](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/utils/cp_build_automation)
