#!/bin/bash

LANG1=it
LANG2=es
LANG3=en
DIR1=$LANG1-$LANG2
DIR2=$LANG2-$LANG3
BASE1=apertium-es-it
BASE2=apertium-en-es
PATH1=../../trunk/$BASE1
PATH2=../../trunk/$BASE2


apertium-transfer $PATH1/$BASE1.$DIR1.t1x $PATH1/$DIR1.t1x.bin $PATH1/$DIR1.autobil.bin |\
sed -e 's/\^default<default>{//g'|\
sed -e 's/}\$//g'|\
apertium-transfer $PATH2/$BASE2.$DIR2.t1x $PATH2/$DIR2.t1x.bin $PATH2/$DIR2.autobil.bin |\
apertium-interchunk $PATH2/$BASE2.$DIR2.t2x $PATH2/$DIR2.t2x.bin |\
apertium-postchunk $PATH2/$BASE2.$DIR2.t3x  $PATH2/$DIR2.t3x.bin |\
sed -e 's/^\^//g'|\
sed -e 's/\$$//g'

