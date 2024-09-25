#Matrixx-14 build_script_blossom

# Remove some stuffs
rm -rf .repo/local_manifests
rm -rf  vendor/xiaomi
rm -rf  kernel/xiaomi
rm -rf  device/xiaomi
rm -rf  device/mediatek
rm -rf  hardware/mediatek
echo "===================================="
echo "Removing stuffs success..."
echo "===================================="

# Clone local_manifests repository
git clone https://github.com/AsTechpro20/local_manifests_blossom.git -b idk .repo/local_manifests
echo "===================================="
echo "Cloning local_manifests was success..."
echo "===================================="

# Initialize Matrixx-14 repo
repo init -u https://github.com/AsTechpro20/platform_manifest_RR.git -b Q
echo "===================================="
echo "Initializing Matrixx-14 repo was success..."
echo "===================================="

# Sync the repositories
/opt/crave/resync.sh || repo sync
echo "===================================="
echo "Syncing the repositories was success..."
echo "===================================="

# Exports
echo "===================================="
echo "Adding exports..."
echo "===================================="
export BUILD_USERNAME=AsTechpro20
export BUILD_HOSTNAME=crave

# Set up build environment
echo "===================================="
echo "Setting up build environment..."
echo "===================================="
source build/envsetup.sh

#Building Matrixx-14
echo "===================================="
echo "Building Matrixx-14..."
echo "===================================="
lunch rr_blossom-userdebug && mka bacon

