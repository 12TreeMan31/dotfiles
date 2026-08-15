SUM=`cat /sys/class/backlight/amdgpu_bl1/brightness`; if (($SUM < 6400)); then SUM=$(($SUM + 250)); echo $SUM > /sys/class/backlight/amdgpu_bl1/brightness; fi;
