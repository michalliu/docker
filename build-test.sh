#!/bin/sh
. envsetup.sh

go build -x -v \
-gccgoflags \
"-static-libgo -static-libgcc -v -Wl,-t" \
github.com/docker/docker/daemon/execdriver/native \
2>&1 | tee build-tes.log
