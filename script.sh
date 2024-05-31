#ProjectSakura-A14 build script
#!/bin/bash

# Remove existing local_manifests
echo "Removing existing local_manifests..."
rm -rf .repo/local_manifests/ || { echo "Failed to remove local_manifests"; exit 1; }

# Initialize ProjectSakura repo
echo "Initializing ProjectSakura repo..."
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 14 --git-lfs || { echo "Repo init failed"; exit 1; }

# Clone local_manifests repository
echo "Cloning local_manifests repository..."
git clone https://github.com/AsTechpro20/local_manifests -b a14-manifests .repo/local_manifests || { echo "Cloning local_manifests failed"; exit 1; }

# Set build details
export BUILD_USERNAME=AsTechpro20 
export BUILD_HOSTNAME=crave

# Sync the repositories
echo "Syncing the repositories..."
/opt/crave/resync.sh || { echo "Resync failed"; exit 1; }

# Set up build environment
echo "Setting up build environment..."
source build/envsetup.sh || { echo "Envsetup failed"; exit 1; }

# Lunch configuration
echo "Configuring lunch..."
lunch lineage_Mi439_4_19-ap1a-userdebug || { echo "Lunch configuration failed"; exit 1; }

# Build the ProjectSakura
echo "Building ProjectSakura..."
mka bacon || { echo "Build failed"; exit 1; }

echo "Build completed successfully!"
