#DotOS-11 build script
#!/bin/bash

# Remove existing local_manifests
echo "Removing existing local_manifests..."
rm -rf .repo/local_manifests/ 

# Initialize DotOS repo
echo "Initializing DotOS repo..."
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 11

# Clone local_manifests repository
echo "Cloning local_manifests repository..."
git clone https://github.com/AsTechpro20/local_manifests.git -b ProjectSakura-11 .repo/local_manifests

# Sync the repositories
echo "Syncing the repositories..."
/opt/crave/resync.sh 

# Set up build environment
echo "Setting up build environment..."
. build/envsetup.sh

# Lunch configuration
echo "Configuring lunch..."
lunch lineage_Mi439_4_19-userdebug

# Build the DotOS-11
echo "Building DotOS-11..."
make bacon

echo "Build completed successfully!"
