#!/bin/bash
BRIGHTNESS_VALUE=`brightnessctl | grep -o "(.*" | tr -d "()"`
BRIGHTNESS_NR=${BRIGHTNESS_VALUE//%}
REDSHIFT_RUNNING=$(pgrep -x redshift)

if [ $BRIGHTNESS_NR -lt 30 ]; then
	if [ -n "$REDSHIFT_RUNNING" ]; then
		BRIGHTNESS_ICON='󰃜'
	else
		BRIGHTNESS_ICON='󰃞'
	fi
elif [ $BRIGHTNESS_NR -lt 70 ]; then
	if [ -n "$REDSHIFT_RUNNING" ]; then
		BRIGHTNESS_ICON='󰃛'
	else
		BRIGHTNESS_ICON='󰃟'
	fi
else
	if [ -n "$REDSHIFT_RUNNING" ]; then
		BRIGHTNESS_ICON='󰃚'
	else
		BRIGHTNESS_ICON='󰃠'
	fi
fi

echo "$BRIGHTNESS_ICON $BRIGHTNESS_VALUE"

