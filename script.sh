#AfterLife-14 build_script_blossom

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

# Initialize AfterLife-14 repo
repo init --depth=1 -u https://github.com/AfterlifeOS/android_manifest.git -b 14 --git-lfs
echo "===================================="
echo "Initializing AfterLife-14 repo was success..."
echo "===================================="

# Clone local_manifests repository
git clone https://github.com/AsTechpro20/local_manifests_blossom.git -b Lineage-21 .repo/local_manifests
echo "===================================="
echo "Cloning local_manifests was success..."
echo "===================================="

# Sync the repositories
/opt/crave/resync.sh || repo sync
echo "===================================="
echo "Syncing the repositories was success..."
echo "===================================="

#  Patch
rm -rf external/chromium-webview  
echo "===================================="
echo "Patch done!..."
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
. build/envsetup.sh

#Building AfterLife-14
echo "===================================="
echo "Building AfterLife-14..."
echo "===================================="
goafterlife blossom
 
