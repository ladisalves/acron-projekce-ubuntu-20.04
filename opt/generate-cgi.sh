#!/bin/bash

echo "Content-type: text/html"
echo ""

STAGE=0
RESULT=""
GDT=`date`
DIR="/opt"

#if [ -e date.html ]; then
#    DATE=`cat date.html`
#    RESULT=`cat template.html | sed "s/!DT!/$DATE/g"`
#    STAGE=`expr $STAGE + 1`
#fi

cd $DIR

wget -q -Orates.html http://192.168.104.2/00acron/rates.php

if [ -s rates.html ]; then

RESULT=`cat template.html` 
STAGE=`expr $STAGE + 1`

if [ -n "$RESULT" ]; then
    if [ -e rates.html ]; then
        RATES=`cat rates.html | xargs echo | sed 's=\n==g' | sed 's=/=\\\/=g' | sed 's="=X=g'`
        #echo $RATES
        RESULT=`echo "$RESULT" | sed "s/!RATES!/$RATES/g"`
	STAGE=`expr $STAGE + 1`
    fi
else
    #echo error 1
    #echo "err 1"  | mail -s"ParkInn - problem s kurzy" ls@cr8.cz
    echo "$GDT err 1" >> log.txt
fi


if [ $STAGE -eq 2 ]; then
    echo "$RESULT" > index-temp.html
    COUNT=`cat index-temp.html | awk '/![^!]*!/' | wc -l`
    if [ $COUNT -ne 0 ]; then
        #echo error 3
	#echo "err 3"  | mail -s"ParkInn - problem s kurzy" ls@cr8.cz    
	echo "$GDT err 3" >> log.txt
    else
      DT=`date +%F`
      cat index.html > index-$DT.html
      mv -f index-temp.html index.html
      echo "$GDT OK" >> log.txt 
    fi
else 
    #echo error 2
    #echo "err 2"  | mail -s"ParkInn - problem s kurzy" ls@cr8.cz
    echo "$GDT err 2" >> log.txt
fi

else
    #echo error 4
    #echo "err 4"  | mail -s"ParkInn - problem s kurzy" ls@cr8.cz
    echo "$GDT err 4" >> log.txt
fi

tail -n1 log.txt