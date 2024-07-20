#ProjectSakura-11 build script

# Remove existing local_manifests
echo "Removing existing local_manifests..."
rm -rf .repo/local_manifests/ 

# Clone local_manifests repository
echo "Cloning local_manifests repository..."
git clone https://github.com/AsTechpro20/local_manifests.git -b ProjectSakura-11 .repo/local_manifests

# Initialize ProjectSakura repo
echo "Initializing DotOS repo..."
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 11

# Sync the repositories
echo "Syncing the repositories..."
/opt/crave/resync.sh 

# Set up build environment
echo "Setting up build environment..."
. build/envsetup.sh

# Lunch configuration
echo "Configuring lunch..."
lunch lineage_Mi439-userdebug

# Build the ProjectSakura
echo "Building ProjectSakura-11..."
make installclean
make bacon

echo "Build completed successfully!"
