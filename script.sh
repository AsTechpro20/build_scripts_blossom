#ProjectSakura-A14 build script
#!/bin/bash

# Remove existing local_manifests
echo "Removing existing local_manifests..."
rm -rf .repo/local_manifests/ || { echo "Failed to remove local_manifests"; exit 1; }

# Initialize ProjectSakura repo
echo "Initializing ProjectSakura repo..."
repo init -u https://github.com/alphadroid-project/manifest -b alpha-14 --git-lfs || { echo "Repo init failed"; exit 1; }

# Clone local_manifests repository
echo "Cloning local_manifests repository..."
git clone https://github.com/PhantomEnigma/local_manifests_clo.git -b udc-2-evo .repo/local_manifests || { echo "Cloning local_manifests failed"; exit 1; }

# Set build details
export BUILD_USERNAME=AsTechpro20 
export BUILD_HOSTNAME=crave

# Sync the repositories
echo "Syncing the repositories..."
/opt/crave/resync.sh || { echo "Resync failed"; exit 1; }

# Initialize repo with Git LFS
echo "Reinitializing repo with Git LFS..."
repo forall -vc "git lfs pull" || { echo "Repo re-init with Git LFS failed"; exit 1; }

# Set up build environment
echo "Setting up build environment..."
. build/envsetup.sh || { echo "Envsetup failed"; exit 1; }

# Lunch configuration
echo "Configuring lunch..."
lunch lineage_mi439-ap1a-userdebug || { echo "Lunch configuration failed"; exit 1; }

# Build the ProjectSakura
echo "Building ProjectSakura..."
make bacon || { echo "Build failed"; exit 1; }

brunch mi439
echo "Build completed successfully!"
