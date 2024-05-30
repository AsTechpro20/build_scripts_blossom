#ProjectSakura building scrpit for crave

rm -rf .repo/local_manifests/

#Repo init rom
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 14 --git-lfs

#Local manifests
git clone https://github.com/AsTechpro20/local_manifests -b sakura-14 .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_mi439-ap1a-userdebug
mka baco