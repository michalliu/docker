#!/bin/sh
. envsetup.sh
SCRIPT=/tmp/build-binary-dryrun.log
RUN=run.sh
if [ ! -f $RUN ];then
./hack/make.sh binary-dryrun 2>&1 | tee $SCRIPT > /dev/null 2>&1
sed -i -e 1,13d $SCRIPT
(cat << EOF; cat $SCRIPT) > $RUN
set -e
set -v
. envsetup.sh
WORK=/tmp/go-docker
mkdir -p bundles/1.3.1/binary-dryrun
EOF
chmod +x $RUN
fi
chmod +x $RUN
./$RUN 2>&1 | tee run.log
