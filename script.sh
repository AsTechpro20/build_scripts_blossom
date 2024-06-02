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

#Patch for unrecognized property "product_variables.malloc_not_svelte.srcs" issue
#Change to the build/soong directory
echo "Change to the build/soong directory"
cd build/soong || { echo "Directory not found: build/soong"; exit 1; }

#Applying patch
echo "Applying patches..."
curl https://github.com/LineageOS/android_build_soong/commit/dea6617bc5bb1675e27d9e77f20e1ef31c9f3c4b.patch | git am || { echo "Failed to apply the patch"; exit 1; }

#Back to main dir
echo "Back to main dir"
croot

# Initialize repo with Git LFS
echo "Reinitializing repo with Git LFS..."
repo forall -vc "git lfs pull" || { echo "Repo re-init with Git LFS failed"; exit 1; }

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
