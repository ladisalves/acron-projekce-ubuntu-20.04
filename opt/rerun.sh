#!/bin/bash

export DISPLAY=:0

if ps ax | grep -v grep | grep firefox > /dev/null
then
	exit
else
	firefox --kiosk file:///opt/index.html&
fi

exit
