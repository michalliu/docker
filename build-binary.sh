#!/bin/sh
. envsetup.sh
./hack/make.sh binary 2>&1 | tee build-binary.log
