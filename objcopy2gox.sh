#!/bin/sh
set -e
set -v
. envsetup.sh
WORK=/tmp/go-docker
#find $WORK -name "*.o" -exec sh -c "echo {}; objcopy {} {}.gox; echo {};" \;
for F in `find $WORK -name "*.o"`
do
  #echo "processing $F"
  objcopy $F $F.gox
  mv $F.gox ${F%.o}.gox
  echo "created ${F%.o}.gox"
done
