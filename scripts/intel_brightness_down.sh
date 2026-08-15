#!/bin/bash
SUM=`cat /sys/class/backlight/intel_backlight/brightness`; if (($SUM > 50)); then SUM=$(($SUM - 50)); echo $SUM > /sys/class/backlight/intel_backlight/brightness; fi;
