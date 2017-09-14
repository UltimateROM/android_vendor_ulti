for combo in $(cat /media/f/root/CM15/android/vendor/lineage/lineage-build-targets | sed -e 's/#.*$//' | grep lineage-15.0 | awk '{printf "lineage_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
