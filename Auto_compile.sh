cd ../../..
echo "Updating sources..."
repo sync -j2 -f
echo "Complete! Removing Xiaomi's tree..."
rm -rf device/Xiaomi
rm -rf vendor/Xiaomi
echo "          Removing Screencast..."
rm -rf packages/apps/Screencast
echo "          Patching CMUpdater..."
rm -rf packages/apps/CMUpdater
git clone https://github.com/mrwigleg/packages_apps_CMUpdater -b cm-13.0 CMUpdater
echo "          Updating Lenovo's tree..."
rm -rf device/Lenovo/A3300
rm -rf vendor/Lenovo/A3300
cd device/Lenovo
git clone https://github.com/mrwigleg/android_device_Lenovo_A3300 A3300
cd ../../vendor/Lenovo
git clone https://github.com/mrwigleg/android_vendor_Lenovo_A3300 A3300
cd ../..
echo "Complete. Prepairing to build Android..."
. build/envsetup.sh
mka clean
lunch cm_A3300-userdebug
echo "Complete. Building Android..."
mka bacon -j7
echo "Successfully completed. Copying to http://95.183.9.234/NewROM..."
rm -rf /var/www/html/graloock.su/NewROM
mkdir /var/www/html/graloock.su/NewROM
cp out/target/product/A3300/cm-13.0* /var/www/graloock.su/NewROM
cp out/target/product/A3300/cm_A3300* /var/www/graloock.su/NewROM
cp out/target/product/A3300/recovery.img /var/www/graloock.su/NewROM
echo "Successfully copied. Open on your browser this page: http://95.183.9.234/NewROM and check your ROM."
echo "                                           "
echo "==========================================="
echo "||          Successful builded!          ||"
echo "||  Nice work, Graloock! Good luck! >:D  ||"
echo "==========================================="
