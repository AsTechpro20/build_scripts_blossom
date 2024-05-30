#ProjectSakura-A14 build script

#Remove existing local_mainfests
rm -rf .repo/local_manifests/

#ProjectSakura repo init
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 14 --git-lfs

# Clone local_manifests repository
git clone https://github.com/AsTechpro20/local_manifests -b main .repo/local_manifests && \

#Details
export BUILD_USERNAME=AsTechpro20 
export BUILD_HOSTNAME=crave

# Sync the repositories
/opt/crave/resync.sh && \ 

# Set up build environment
source build/envsetup.sh && \

# Lunch configuration
lunch lineage_mi439-ap1a-userdebug && \

# Build the ProjectSakura
mka bacon"
