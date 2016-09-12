cd ../../..
echo "Updating sources..."
repo sync -j2 -f
echo "Complete! Removing Xiaomi's tree..."
rm -rf device/Xiaomi
rm -rf vendor/Xiaomi
echo "          Removing Screencast..."
rm -rf packages/apps/Screencast
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
echo "Successfully completed. Copying to http://95.183.13.84/NewROM..."
rm -rf /var/www/html/NewROM
mkdir /var/www/html/NewROM
cp out/target/product/A3300/cm-13.0* /var/www/html/NewROM
cp out/target/product/A3300/cm_A3300* /var/www/html/NewROM
cp out/target/product/A3300/recovery.img /var/www/html/NewROM
echo "Successfully copied. Open on your browser this page: http://95.183.13.84/NewROM and check your ROM."
