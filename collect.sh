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






