#!/bin/sh

RSPID=$(pgrep ^redshift);

RET="$?";
echo $RET;
echo $RSPID;

if [ $RET -eq 1 ]; then
    redshift -l 33:-118 &
else
    kill $RSPID;
fi
