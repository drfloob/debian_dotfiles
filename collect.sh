#!/bin/bash

pushd `dirname $0` > /dev/null
CONFIGS=`pwd`/configs
# echo $CONFIGS;
# exit;
popd > /dev/null

cd;

## single config files
cp .gitconfig .bash_aliases .bashrc .xmobarrc .xsession .Xresources \
$CONFIGS

## my scripts
if [ ! -d $CONFIGS/bin ]; then
    mkdir $CONFIGS/bin
fi
cd bin
cp kill_powersave.sh kill_repeat.sh myaudioproxy.sh toggle_qwerty.sh toggle_redshift.sh toggle_VGA1.sh \
$CONFIGS/bin
cd


## xmonad
if [ ! -d $CONFIGS/.xmonad ]; then
    mkdir $CONFIGS/.xmonad
fi
cp .xmonad/xmonad.hs \
$CONFIGS/.xmonad/


## emacs
if [ ! -d $CONFIGS/.emacs.d ]; then
    mkdir $CONFIGS/.emacs.d
fi
cp .emacs.d/init.el \
$CONFIGS/.emacs.d/
cp -r .emacs.d/site-packages \
$CONFIGS/.emacs.d/


## fonts
cp -r .fonts \
$CONFIGS/






