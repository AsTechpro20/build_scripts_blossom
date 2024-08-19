#Lineage-20 build script

# Remove existing local_manifests
echo "Removing existing local_manifests..."
rm -rf .repo/local_manifests/ 
rm -rf  vendor/xiaomi
rm -rf  kernel/xiaomi
rm -rf  device/xiaomi

# Clone local_manifests repository
echo "Cloning local_manifests repository..."
git clone https://github.com/AsTechpro20/local_manifests.git -b A13 .repo/local_manifests

# Initialize Lineage-20 repo
echo "Initializing Lineage-20 repo..."
repo init -u https://github.com/LineageOS/android.git -b lineage-20.0 --git-lfs

# Sync the repositories
echo "Syncing the repositories..."
/opt/crave/resync.sh 

# Exports
echo "Adding exports..."
export BUILD_USERNAME=AsTechpro20
export BUILD_HOSTNAME=crave

# Set up build environment
echo "Setting up build environment..."
source build/envsetup.sh

#Building Lineage-20
echo "Building Lineage-20..."
brunch blossom-userdebug

