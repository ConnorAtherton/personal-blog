#!/bin/bash
#
# Author: Gihan De Silva @  gihansblog.com
# rename script
# rename.sh
clear
x=0
for i in `ls *.JPG`
do
x=`expr $x + 1`
mv $i africa-2-$x.jpg
done

echo “rename done!”
