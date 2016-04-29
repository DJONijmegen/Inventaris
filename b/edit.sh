#!/bin/sh


n=$(printf "%07d" $1);

[ -e $n.json ] || cat $n.txt >> $n.json

vi $n.json

