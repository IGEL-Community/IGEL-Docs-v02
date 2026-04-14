#!/bin/bash
#set -x
#trap read debug

#
# Main Program to build unattended ISO image
#

# Fetch and display IGEL OS versions, download, unpack, patch ISO, write to USB

RELEASE_URL="https://igel-community.github.io/IGEL-Docs-v02/Docs/ReleaseNotes/04-OS12/"
DOWNLOAD_BASE_URL="https://igeldownloadprod-bydsc8hmbsaegvdy.a01.azurefd.net/files/IGEL_OS_12/OSC"

echo "Fetching available IGEL OS versions..."
AVAILABLE_VERSIONS=$(curl -s "$RELEASE_URL" | grep -oP '(?<=<li><a href="readme)[^"]+' | grep -oP '[0-9]+\.[0-9]+\.[0-9]+')

if [ -z "$AVAILABLE_VERSIONS" ]; then
  echo "No versions found. Exiting."
  exit 1
fi

# Display list of versions
echo -e "\n***********"
echo "Available IGEL OS Versions:"
echo "***********"
mapfile -t VERSION_ARRAY <<< "$AVAILABLE_VERSIONS"
for i in "${!VERSION_ARRAY[@]}"; do
  echo "$((i+1)). ${VERSION_ARRAY[$i]}"
done

# Ask for version selection
echo -e "\n***********"
read -p "Enter the number of the IGEL OS version to download (default is 1): " VERSION_NUMBER
VERSION_NUMBER="${VERSION_NUMBER:-1}"

SELECTED_VERSION="${VERSION_ARRAY[$((VERSION_NUMBER-1))]}"

if [ -z "$SELECTED_VERSION" ]; then
  echo "Invalid selection. Exiting."
  exit 1
fi

OUTPUT_DIR="$(pwd)/IGEL_OS_$SELECTED_VERSION"
mkdir -p "$OUTPUT_DIR"

DOWNLOAD_URL="${DOWNLOAD_BASE_URL}/osc-${SELECTED_VERSION}.zip"
DOWNLOAD_PATH="$OUTPUT_DIR/osc-${SELECTED_VERSION}.zip"

# Download zip if not already present
if [ -f "$DOWNLOAD_PATH" ]; then
  echo "osc-${SELECTED_VERSION}.zip already exists. Skipping download."
else
  echo "Downloading $SELECTED_VERSION from $DOWNLOAD_URL..."
  wget -O "$DOWNLOAD_PATH" "$DOWNLOAD_URL"
  [[ -f "$DOWNLOAD_PATH" ]] || { echo "Download failed. Exiting."; exit 1; }
  echo "Download complete."
fi

# Create ISO
ISO_IMAGE_NAME="OSC_${SELECTED_VERSION}.unattended.iso"
ISO_IMAGE_PATH="$OUTPUT_DIR/$ISO_IMAGE_NAME"

if [ -f "$ISO_IMAGE_PATH" ]; then
  echo "ISO already exists: $ISO_IMAGE_PATH"
else
  echo "Creating unattended ISO..."

  WORK_DIR="$OUTPUT_DIR/build_tar"
  mkdir -p "$WORK_DIR/custom"
  pushd .
  cd "$WORK_DIR/custom"

  unzip "$DOWNLOAD_PATH"

  mkdir osciso
  mount -o loop preparestick/osc*.iso osciso
  mkdir newiso
  cp -a osciso/. newiso
  umount osciso
  rm -rf preparestick
  rmdir osciso
  popd
  mv "$WORK_DIR/custom/newiso" .
  rm -rf $WORK_DIR

  # Patch for unattended install
  if [ ! -f "newiso/boot/grub/igel-unattended.conf" ]; then
    echo "Adding unattended flag to igel.conf..."
    sed -i '/splash=277/ s/$/ osc_unattended=true/' newiso/boot/grub/igel.conf
    sed -i 's/^set timeout=.*/set timeout=2/' newiso/boot/grub/igel.conf
  else
    cd newiso/boot/grub
    mv igel-unattended.conf igel.conf
    mv igel-unattended.conf.sig igel.conf.sig
    cd ../../..
  fi

  ./run-docker.sh

  mv artifacts/OSC_version.unattended.iso $OUTPUT_DIR/OSC_$SELECTED_VERSION.unattended.iso
  rm -rf artifacts newiso
fi
