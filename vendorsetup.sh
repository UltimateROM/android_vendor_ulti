for combo in $(curl -s https://raw.githubusercontent.com/UltimateROM/android_vendor_ulti/cm-15.0/lineage-build-targets | sed -e 's/#.*$//' | grep lineage-15.0 | awk '{printf "lineage_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
