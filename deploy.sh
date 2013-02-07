#!/bin/bash

pushd `dirname $0` > /dev/null
CONFIGS=`pwd`/configs
popd > /dev/null

SOURCEDIR=$CONFIGS;
DESTDIR=$HOME;

cd $SOURCEDIR;

## single config files
cp .gitconfig .bash_aliases .bashrc .xmobarrc .xsession .Xresources \
$DESTDIR

## my scripts
if [ ! -d $DESTDIR/bin ]; then
    mkdir $DESTDIR/bin
fi
cd $SOURCEDIR/bin
cp kill_powersave.sh kill_repeat.sh myaudioproxy.sh toggle_qwerty.sh toggle_redshift.sh toggle_VGA1.sh \
$DESTDIR/bin
cd $SOURCEDIR;


## xmonad
if [ ! -d $DESTDIR/.xmonad ]; then
    mkdir $DESTDIR/.xmonad
fi
cp .xmonad/xmonad.hs \
$DESTDIR/.xmonad/


## emacs
if [ ! -d $DESTDIR/.emacs.d ]; then
    mkdir $DESTDIR/.emacs.d
fi
cp .emacs.d/init.el \
$DESTDIR/.emacs.d/
cp -r .emacs.d/site-packages \
$DESTDIR/.emacs.d/


## fonts
cp -r .fonts \
$DESTDIR/






