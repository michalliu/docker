set -e
set -v
. envsetup.sh
WORK=/tmp/go-docker
mkdir -p bundles/1.3.1/binary-dryrun
#
# github.com/docker/docker/daemon/graphdriver/devmapper
#

mkdir -p $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/
cd /go/src/github.com/docker/docker/daemon/graphdriver/devmapper
/usr/pkg/tool/linux_mipso32/cgo -objdir $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/ -gccgo -gccgopkgpath=github.com/docker/docker/daemon/graphdriver/devmapper -- -I $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/ devmapper_log.go devmapper_wrapper.go
gcc -Wall -g -I $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/ -I /usr/pkg/linux_mipso32 -o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_defun.o -D GOOS_linux -D GOARCH_mipso32 -D "GOPKGPATH=\"github_com_docker_docker_daemon_graphdriver_devmapper\"" -c $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_defun.c
gcc -I . -g -O2 -fPIC -pthread -I $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/ -o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_main.o -c $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_main.c
gcc -I . -g -O2 -fPIC -pthread -I $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/ -o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_export.o -c $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_export.c
gcc -I . -g -O2 -fPIC -pthread -I $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/ -o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper_log.cgo2.o -c $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper_log.cgo2.c
gcc -I . -g -O2 -fPIC -pthread -I $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/ -o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper_wrapper.cgo2.o -c $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper_wrapper.cgo2.c
gcc -I . -g -O2 -fPIC -pthread -o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_.o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_main.o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_export.o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper_log.cgo2.o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper_wrapper.cgo2.o -L. -ldevmapper
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/daemon/graphdriver/devmapper -fgo-relative-import-path=_/go/src/github.com/docker/docker/daemon/graphdriver/devmapper -o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper.o -static-libgo -static-libgcc ./attach_loopback.go ./deviceset.go ./devmapper.go ./devmapper_doc.go ./driver.go ./ioctl.go ./mount.go $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_gotypes.go $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper_log.cgo1.go $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper_wrapper.cgo1.go
ar cru $WORK/github.com/docker/docker/daemon/graphdriver/libdevmapper.a $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper.o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_defun.o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/_cgo_export.o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper_log.cgo2.o $WORK/github.com/docker/docker/daemon/graphdriver/devmapper/_obj/devmapper_wrapper.cgo2.o

#
# github.com/docker/docker/daemon/graphdriver/vfs
#

mkdir -p $WORK/github.com/docker/docker/daemon/graphdriver/vfs/_obj/
cd /go/src/github.com/docker/docker/daemon/graphdriver/vfs
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/daemon/graphdriver/vfs -fgo-relative-import-path=_/go/src/github.com/docker/docker/daemon/graphdriver/vfs -o $WORK/github.com/docker/docker/daemon/graphdriver/vfs/_obj/vfs.o -static-libgo -static-libgcc ./driver.go
ar cru $WORK/github.com/docker/docker/daemon/graphdriver/libvfs.a $WORK/github.com/docker/docker/daemon/graphdriver/vfs/_obj/vfs.o

#
# github.com/docker/docker/daemon/networkdriver
#

mkdir -p $WORK/github.com/docker/docker/daemon/networkdriver/_obj/
cd /go/src/github.com/docker/docker/daemon/networkdriver
gccgo -I $WORK -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/daemon/networkdriver -fgo-relative-import-path=_/go/src/github.com/docker/docker/daemon/networkdriver -o $WORK/github.com/docker/docker/daemon/networkdriver/_obj/networkdriver.o -static-libgo -static-libgcc ./network.go ./utils.go
ar cru $WORK/github.com/docker/docker/daemon/libnetworkdriver.a $WORK/github.com/docker/docker/daemon/networkdriver/_obj/networkdriver.o

#
# github.com/docker/docker/daemon/networkdriver/ipallocator
#

mkdir -p $WORK/github.com/docker/docker/daemon/networkdriver/ipallocator/_obj/
mkdir -p $WORK/github.com/docker/docker/daemon/networkdriver/
cd /go/src/github.com/docker/docker/daemon/networkdriver/ipallocator
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/daemon/networkdriver/ipallocator -fgo-relative-import-path=_/go/src/github.com/docker/docker/daemon/networkdriver/ipallocator -o $WORK/github.com/docker/docker/daemon/networkdriver/ipallocator/_obj/ipallocator.o -static-libgo -static-libgcc ./allocator.go
ar cru $WORK/github.com/docker/docker/daemon/networkdriver/libipallocator.a $WORK/github.com/docker/docker/daemon/networkdriver/ipallocator/_obj/ipallocator.o

#
# github.com/docker/docker/daemon/networkdriver/portallocator
#

mkdir -p $WORK/github.com/docker/docker/daemon/networkdriver/portallocator/_obj/
cd /go/src/github.com/docker/docker/daemon/networkdriver/portallocator
gccgo -I $WORK -c -g -fgo-pkgpath=github.com/docker/docker/daemon/networkdriver/portallocator -fgo-relative-import-path=_/go/src/github.com/docker/docker/daemon/networkdriver/portallocator -o $WORK/github.com/docker/docker/daemon/networkdriver/portallocator/_obj/portallocator.o -static-libgo -static-libgcc ./portallocator.go
ar cru $WORK/github.com/docker/docker/daemon/networkdriver/libportallocator.a $WORK/github.com/docker/docker/daemon/networkdriver/portallocator/_obj/portallocator.o

#
# github.com/docker/docker/pkg/iptables
#

mkdir -p $WORK/github.com/docker/docker/pkg/iptables/_obj/
cd /go/src/github.com/docker/docker/pkg/iptables
gccgo -I $WORK -c -g -fgo-pkgpath=github.com/docker/docker/pkg/iptables -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/iptables -o $WORK/github.com/docker/docker/pkg/iptables/_obj/iptables.o -static-libgo -static-libgcc ./iptables.go
ar cru $WORK/github.com/docker/docker/pkg/libiptables.a $WORK/github.com/docker/docker/pkg/iptables/_obj/iptables.o

#
# github.com/docker/docker/pkg/proxy
#

mkdir -p $WORK/github.com/docker/docker/pkg/proxy/_obj/
cd /go/src/github.com/docker/docker/pkg/proxy
gccgo -I $WORK -c -g -fgo-pkgpath=github.com/docker/docker/pkg/proxy -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/proxy -o $WORK/github.com/docker/docker/pkg/proxy/_obj/proxy.o -static-libgo -static-libgcc ./proxy.go ./stub_proxy.go ./tcp_proxy.go ./udp_proxy.go
ar cru $WORK/github.com/docker/docker/pkg/libproxy.a $WORK/github.com/docker/docker/pkg/proxy/_obj/proxy.o

#
# github.com/docker/docker/daemon/networkdriver/portmapper
#

mkdir -p $WORK/github.com/docker/docker/daemon/networkdriver/portmapper/_obj/
cd /go/src/github.com/docker/docker/daemon/networkdriver/portmapper
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/daemon/networkdriver/portmapper -fgo-relative-import-path=_/go/src/github.com/docker/docker/daemon/networkdriver/portmapper -o $WORK/github.com/docker/docker/daemon/networkdriver/portmapper/_obj/portmapper.o -static-libgo -static-libgcc ./mapper.go ./mock_proxy.go ./proxy.go
ar cru $WORK/github.com/docker/docker/daemon/networkdriver/libportmapper.a $WORK/github.com/docker/docker/daemon/networkdriver/portmapper/_obj/portmapper.o

#
# github.com/docker/docker/pkg/networkfs/resolvconf
#

mkdir -p $WORK/github.com/docker/docker/pkg/networkfs/resolvconf/_obj/
mkdir -p $WORK/github.com/docker/docker/pkg/networkfs/
cd /go/src/github.com/docker/docker/pkg/networkfs/resolvconf
gccgo -I $WORK -c -g -fgo-pkgpath=github.com/docker/docker/pkg/networkfs/resolvconf -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/networkfs/resolvconf -o $WORK/github.com/docker/docker/pkg/networkfs/resolvconf/_obj/resolvconf.o -static-libgo -static-libgcc ./resolvconf.go
ar cru $WORK/github.com/docker/docker/pkg/networkfs/libresolvconf.a $WORK/github.com/docker/docker/pkg/networkfs/resolvconf/_obj/resolvconf.o

#
# github.com/docker/docker/daemon/networkdriver/bridge
#

mkdir -p $WORK/github.com/docker/docker/daemon/networkdriver/bridge/_obj/
cd /go/src/github.com/docker/docker/daemon/networkdriver/bridge
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/daemon/networkdriver/bridge -fgo-relative-import-path=_/go/src/github.com/docker/docker/daemon/networkdriver/bridge -o $WORK/github.com/docker/docker/daemon/networkdriver/bridge/_obj/bridge.o -static-libgo -static-libgcc ./driver.go
ar cru $WORK/github.com/docker/docker/daemon/networkdriver/libbridge.a $WORK/github.com/docker/docker/daemon/networkdriver/bridge/_obj/bridge.o

#
# github.com/docker/docker/links
#

mkdir -p $WORK/github.com/docker/docker/links/_obj/
cd /go/src/github.com/docker/docker/links
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/links -fgo-relative-import-path=_/go/src/github.com/docker/docker/links -o $WORK/github.com/docker/docker/links/_obj/links.o -static-libgo -static-libgcc ./links.go
ar cru $WORK/github.com/docker/docker/liblinks.a $WORK/github.com/docker/docker/links/_obj/links.o

#
# github.com/docker/docker/pkg/jsonlog
#

mkdir -p $WORK/github.com/docker/docker/pkg/jsonlog/_obj/
cd /go/src/github.com/docker/docker/pkg/jsonlog
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/pkg/jsonlog -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/jsonlog -o $WORK/github.com/docker/docker/pkg/jsonlog/_obj/jsonlog.o -static-libgo -static-libgcc ./jsonlog.go ./jsonlog_marshalling.go
ar cru $WORK/github.com/docker/docker/pkg/libjsonlog.a $WORK/github.com/docker/docker/pkg/jsonlog/_obj/jsonlog.o

#
# github.com/docker/docker/pkg/broadcastwriter
#

mkdir -p $WORK/github.com/docker/docker/pkg/broadcastwriter/_obj/
cd /go/src/github.com/docker/docker/pkg/broadcastwriter
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/pkg/broadcastwriter -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/broadcastwriter -o $WORK/github.com/docker/docker/pkg/broadcastwriter/_obj/broadcastwriter.o -static-libgo -static-libgcc ./broadcastwriter.go
ar cru $WORK/github.com/docker/docker/pkg/libbroadcastwriter.a $WORK/github.com/docker/docker/pkg/broadcastwriter/_obj/broadcastwriter.o

#
# code.google.com/p/gosqlite/sqlite3
#

mkdir -p $WORK/code.google.com/p/gosqlite/sqlite3/_obj/
mkdir -p $WORK/code.google.com/p/gosqlite/
cd /go/src/github.com/docker/docker/vendor/src/code.google.com/p/gosqlite/sqlite3
/usr/pkg/tool/linux_mipso32/cgo -objdir $WORK/code.google.com/p/gosqlite/sqlite3/_obj/ -gccgo -gccgopkgpath=code.google.com/p/gosqlite/sqlite3 -- -I $WORK/code.google.com/p/gosqlite/sqlite3/_obj/ driver.go
gcc -Wall -g -I $WORK/code.google.com/p/gosqlite/sqlite3/_obj/ -I /usr/pkg/linux_mipso32 -o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_defun.o -D GOOS_linux -D GOARCH_mipso32 -D "GOPKGPATH=\"code_google_com_p_gosqlite_sqlite3\"" -c $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_defun.c
gcc -I . -g -O2 -fPIC -pthread -I $WORK/code.google.com/p/gosqlite/sqlite3/_obj/ -o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_main.o -c $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_main.c
gcc -I . -g -O2 -fPIC -pthread -I $WORK/code.google.com/p/gosqlite/sqlite3/_obj/ -o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_export.o -c $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_export.c
gcc -I . -g -O2 -fPIC -pthread -I $WORK/code.google.com/p/gosqlite/sqlite3/_obj/ -o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/driver.cgo2.o -c $WORK/code.google.com/p/gosqlite/sqlite3/_obj/driver.cgo2.c
gcc -I . -g -O2 -fPIC -pthread -o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_.o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_main.o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_export.o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/driver.cgo2.o -lsqlite3
gccgo -I $WORK -c -g -fgo-pkgpath=code.google.com/p/gosqlite/sqlite3 -fgo-relative-import-path=_/go/src/github.com/docker/docker/vendor/src/code.google.com/p/gosqlite/sqlite3 -o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/sqlite.o -static-libgo -static-libgcc $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_gotypes.go $WORK/code.google.com/p/gosqlite/sqlite3/_obj/driver.cgo1.go
ar cru $WORK/code.google.com/p/gosqlite/libsqlite3.a $WORK/code.google.com/p/gosqlite/sqlite3/_obj/sqlite.o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_defun.o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/_cgo_export.o $WORK/code.google.com/p/gosqlite/sqlite3/_obj/driver.cgo2.o

#
# github.com/docker/docker/pkg/graphdb
#

mkdir -p $WORK/github.com/docker/docker/pkg/graphdb/_obj/
cd /go/src/github.com/docker/docker/pkg/graphdb
gccgo -I $WORK -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/pkg/graphdb -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/graphdb -o $WORK/github.com/docker/docker/pkg/graphdb/_obj/graphdb.o -static-libgo -static-libgcc ./conn_sqlite3.go ./graphdb.go ./sort.go ./utils.go
ar cru $WORK/github.com/docker/docker/pkg/libgraphdb.a $WORK/github.com/docker/docker/pkg/graphdb/_obj/graphdb.o

#
# github.com/docker/docker/pkg/namesgenerator
#

mkdir -p $WORK/github.com/docker/docker/pkg/namesgenerator/_obj/
cd /go/src/github.com/docker/docker/pkg/namesgenerator
gccgo -I $WORK -c -g -fgo-pkgpath=github.com/docker/docker/pkg/namesgenerator -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/namesgenerator -o $WORK/github.com/docker/docker/pkg/namesgenerator/_obj/namesgenerator.o -static-libgo -static-libgcc ./names-generator.go
ar cru $WORK/github.com/docker/docker/pkg/libnamesgenerator.a $WORK/github.com/docker/docker/pkg/namesgenerator/_obj/namesgenerator.o

#
# github.com/docker/docker/pkg/networkfs/etchosts
#

mkdir -p $WORK/github.com/docker/docker/pkg/networkfs/etchosts/_obj/
cd /go/src/github.com/docker/docker/pkg/networkfs/etchosts
gccgo -I $WORK -c -g -fgo-pkgpath=github.com/docker/docker/pkg/networkfs/etchosts -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/networkfs/etchosts -o $WORK/github.com/docker/docker/pkg/networkfs/etchosts/_obj/etchosts.o -static-libgo -static-libgcc ./etchosts.go
ar cru $WORK/github.com/docker/docker/pkg/networkfs/libetchosts.a $WORK/github.com/docker/docker/pkg/networkfs/etchosts/_obj/etchosts.o

#
# github.com/docker/docker/pkg/parsers/operatingsystem
#

mkdir -p $WORK/github.com/docker/docker/pkg/parsers/operatingsystem/_obj/
cd /go/src/github.com/docker/docker/pkg/parsers/operatingsystem
gccgo -I $WORK -c -g -fgo-pkgpath=github.com/docker/docker/pkg/parsers/operatingsystem -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/parsers/operatingsystem -o $WORK/github.com/docker/docker/pkg/parsers/operatingsystem/_obj/operatingsystem.o -static-libgo -static-libgcc ./operatingsystem.go
ar cru $WORK/github.com/docker/docker/pkg/parsers/liboperatingsystem.a $WORK/github.com/docker/docker/pkg/parsers/operatingsystem/_obj/operatingsystem.o

#
# github.com/docker/docker/pkg/tailfile
#

mkdir -p $WORK/github.com/docker/docker/pkg/tailfile/_obj/
cd /go/src/github.com/docker/docker/pkg/tailfile
gccgo -I $WORK -c -g -fgo-pkgpath=github.com/docker/docker/pkg/tailfile -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/tailfile -o $WORK/github.com/docker/docker/pkg/tailfile/_obj/tailfile.o -static-libgo -static-libgcc ./tailfile.go
ar cru $WORK/github.com/docker/docker/pkg/libtailfile.a $WORK/github.com/docker/docker/pkg/tailfile/_obj/tailfile.o

#
# github.com/docker/libtrust/trustgraph
#

mkdir -p $WORK/github.com/docker/libtrust/trustgraph/_obj/
mkdir -p $WORK/github.com/docker/libtrust/
cd /go/src/github.com/docker/docker/vendor/src/github.com/docker/libtrust/trustgraph
gccgo -I $WORK -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/libtrust/trustgraph -fgo-relative-import-path=_/go/src/github.com/docker/docker/vendor/src/github.com/docker/libtrust/trustgraph -o $WORK/github.com/docker/libtrust/trustgraph/_obj/trustgraph.o -static-libgo -static-libgcc ./graph.go ./memory_graph.go ./statement.go
ar cru $WORK/github.com/docker/libtrust/libtrustgraph.a $WORK/github.com/docker/libtrust/trustgraph/_obj/trustgraph.o

#
# github.com/docker/docker/trust
#

mkdir -p $WORK/github.com/docker/docker/trust/_obj/
cd /go/src/github.com/docker/docker/trust
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/trust -fgo-relative-import-path=_/go/src/github.com/docker/docker/trust -o $WORK/github.com/docker/docker/trust/_obj/trust.o -static-libgo -static-libgcc ./service.go ./trusts.go
ar cru $WORK/github.com/docker/docker/libtrust.a $WORK/github.com/docker/docker/trust/_obj/trust.o

#
# github.com/docker/docker/volumes
#

mkdir -p $WORK/github.com/docker/docker/volumes/_obj/
cd /go/src/github.com/docker/docker/volumes
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/volumes -fgo-relative-import-path=_/go/src/github.com/docker/docker/volumes -o $WORK/github.com/docker/docker/volumes/_obj/volumes.o -static-libgo -static-libgcc ./repository.go ./volume.go
ar cru $WORK/github.com/docker/docker/libvolumes.a $WORK/github.com/docker/docker/volumes/_obj/volumes.o

#
# github.com/docker/libcontainer/selinux
#

mkdir -p $WORK/github.com/docker/libcontainer/selinux/_obj/
cd /go/src/github.com/docker/docker/vendor/src/github.com/docker/libcontainer/selinux
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/libcontainer/selinux -fgo-relative-import-path=_/go/src/github.com/docker/docker/vendor/src/github.com/docker/libcontainer/selinux -o $WORK/github.com/docker/libcontainer/selinux/_obj/selinux.o -static-libgo -static-libgcc ./selinux.go
ar cru $WORK/github.com/docker/libcontainer/libselinux.a $WORK/github.com/docker/libcontainer/selinux/_obj/selinux.o

#
# github.com/docker/docker/daemon
#

mkdir -p $WORK/github.com/docker/docker/daemon/_obj/
cd /go/src/github.com/docker/docker/daemon
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/daemon -fgo-relative-import-path=_/go/src/github.com/docker/docker/daemon -o $WORK/github.com/docker/docker/daemon/_obj/daemon.o -static-libgo -static-libgcc ./attach.go ./changes.go ./commit.go ./config.go ./container.go ./copy.go ./create.go ./daemon.go ./daemon_aufs.go ./daemon_btrfs.go ./daemon_devicemapper.go ./delete.go ./exec.go ./export.go ./history.go ./image_delete.go ./info.go ./inspect.go ./kill.go ./list.go ./logs.go ./monitor.go ./network_settings.go ./pause.go ./resize.go ./restart.go ./start.go ./state.go ./stop.go ./top.go ./utils.go ./utils_linux.go ./volumes.go ./wait.go
ar cru $WORK/github.com/docker/docker/libdaemon.a $WORK/github.com/docker/docker/daemon/_obj/daemon.o

#
# github.com/docker/docker/builder
#

mkdir -p $WORK/github.com/docker/docker/builder/_obj/
cd /go/src/github.com/docker/docker/builder
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/builder -fgo-relative-import-path=_/go/src/github.com/docker/docker/builder -o $WORK/github.com/docker/docker/builder/_obj/builder.o -static-libgo -static-libgcc ./dispatchers.go ./evaluator.go ./internals.go ./job.go ./support.go
ar cru $WORK/github.com/docker/docker/libbuilder.a $WORK/github.com/docker/docker/builder/_obj/builder.o

#
# code.google.com/p/go.net/websocket
#

mkdir -p $WORK/code.google.com/p/go.net/websocket/_obj/
mkdir -p $WORK/code.google.com/p/go.net/
cd /go/src/github.com/docker/docker/vendor/src/code.google.com/p/go.net/websocket
gccgo -I $WORK -c -g -fgo-pkgpath=code.google.com/p/go.net/websocket -fgo-relative-import-path=_/go/src/github.com/docker/docker/vendor/src/code.google.com/p/go.net/websocket -o $WORK/code.google.com/p/go.net/websocket/_obj/websocket.o -static-libgo -static-libgcc ./client.go ./hixie.go ./hybi.go ./server.go ./websocket.go
ar cru $WORK/code.google.com/p/go.net/libwebsocket.a $WORK/code.google.com/p/go.net/websocket/_obj/websocket.o

#
# github.com/docker/docker/pkg/listenbuffer
#

mkdir -p $WORK/github.com/docker/docker/pkg/listenbuffer/_obj/
cd /go/src/github.com/docker/docker/pkg/listenbuffer
gccgo -I $WORK -c -g -fgo-pkgpath=github.com/docker/docker/pkg/listenbuffer -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/listenbuffer -o $WORK/github.com/docker/docker/pkg/listenbuffer/_obj/listenbuffer.o -static-libgo -static-libgcc ./buffer.go
ar cru $WORK/github.com/docker/docker/pkg/liblistenbuffer.a $WORK/github.com/docker/docker/pkg/listenbuffer/_obj/listenbuffer.o

#
# github.com/coreos/go-systemd/activation
#

mkdir -p $WORK/github.com/coreos/go-systemd/activation/_obj/
cd /go/src/github.com/docker/docker/vendor/src/github.com/coreos/go-systemd/activation
gccgo -I $WORK -c -g -fgo-pkgpath=github.com/coreos/go-systemd/activation -fgo-relative-import-path=_/go/src/github.com/docker/docker/vendor/src/github.com/coreos/go-systemd/activation -o $WORK/github.com/coreos/go-systemd/activation/_obj/activation.o -static-libgo -static-libgcc ./files.go ./listeners.go
ar cru $WORK/github.com/coreos/go-systemd/libactivation.a $WORK/github.com/coreos/go-systemd/activation/_obj/activation.o

#
# github.com/docker/docker/pkg/systemd
#

mkdir -p $WORK/github.com/docker/docker/pkg/systemd/_obj/
cd /go/src/github.com/docker/docker/pkg/systemd
gccgo -I $WORK -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/pkg/systemd -fgo-relative-import-path=_/go/src/github.com/docker/docker/pkg/systemd -o $WORK/github.com/docker/docker/pkg/systemd/_obj/systemd.o -static-libgo -static-libgcc ./booted.go ./listendfd.go ./sd_notify.go
ar cru $WORK/github.com/docker/docker/pkg/libsystemd.a $WORK/github.com/docker/docker/pkg/systemd/_obj/systemd.o

#
# github.com/docker/docker/api/server
#

mkdir -p $WORK/github.com/docker/docker/api/server/_obj/
cd /go/src/github.com/docker/docker/api/server
gccgo -I $WORK -I /go/src/github.com/docker/docker/vendor/pkg/gccgo_linux_mipso32 -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/api/server -fgo-relative-import-path=_/go/src/github.com/docker/docker/api/server -o $WORK/github.com/docker/docker/api/server/_obj/server.o -static-libgo -static-libgcc ./server.go
ar cru $WORK/github.com/docker/docker/api/libserver.a $WORK/github.com/docker/docker/api/server/_obj/server.o

#
# github.com/docker/docker/events
#

mkdir -p $WORK/github.com/docker/docker/events/_obj/
cd /go/src/github.com/docker/docker/events
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/events -fgo-relative-import-path=_/go/src/github.com/docker/docker/events -o $WORK/github.com/docker/docker/events/_obj/events.o -static-libgo -static-libgcc ./events.go
ar cru $WORK/github.com/docker/docker/libevents.a $WORK/github.com/docker/docker/events/_obj/events.o

#
# github.com/docker/docker/builtins
#

mkdir -p $WORK/github.com/docker/docker/builtins/_obj/
cd /go/src/github.com/docker/docker/builtins
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-pkgpath=github.com/docker/docker/builtins -fgo-relative-import-path=_/go/src/github.com/docker/docker/builtins -o $WORK/github.com/docker/docker/builtins/_obj/builtins.o -static-libgo -static-libgcc ./builtins.go
ar cru $WORK/github.com/docker/docker/libbuiltins.a $WORK/github.com/docker/docker/builtins/_obj/builtins.o

#
# _/root/docker/docker
#

mkdir -p $WORK/_/root/docker/docker/_obj/
mkdir -p /root/docker/bundles/1.3.1/binary-dryrun/
cd /root/docker/docker
gccgo -I $WORK -I /go/pkg/gccgo_linux_mipso32 -c -g -fgo-relative-import-path=_/root/docker/docker -o $WORK/_/root/docker/docker/_obj/main.o -static-libgo -static-libgcc ./daemon.go ./docker.go ./flags.go
ar cru $WORK/_/root/docker/libdocker.a $WORK/_/root/docker/docker/_obj/main.o
cd .
gccgo -o /root/docker/bundles/1.3.1/binary-dryrun/docker-1.3.1 $WORK/_/root/docker/docker/_obj/main.o -Wl,-( $WORK/github.com/docker/docker/pkg/libioutils.a $WORK/github.com/docker/docker/libdockerversion.a $WORK/github.com/docker/docker/pkg/liblog.a $WORK/github.com/docker/docker/pkg/libfileutils.a $WORK/github.com/docker/docker/pkg/libterm.a $WORK/github.com/docker/docker/pkg/libtimeutils.a $WORK/github.com/docker/docker/pkg/libunits.a $WORK/github.com/docker/docker/libutils.a $WORK/github.com/docker/docker/libengine.a $WORK/github.com/docker/docker/pkg/libparsers.a $WORK/github.com/docker/docker/pkg/libversion.a $WORK/github.com/docker/docker/libapi.a $WORK/github.com/docker/docker/pkg/libpools.a $WORK/github.com/docker/docker/pkg/libpromise.a $WORK/github.com/docker/docker/pkg/libsystem.a $WORK/github.com/docker/docker/vendor/src/code.google.com/p/go/src/pkg/archive/libtar.a $WORK/github.com/docker/docker/pkg/libarchive.a $WORK/github.com/docker/docker/pkg/libmount.a $WORK/github.com/docker/docker/daemon/libgraphdriver.a $WORK/github.com/docker/docker/libnat.a $WORK/github.com/docker/docker/pkg/libmflag.a $WORK/github.com/docker/docker/libopts.a $WORK/github.com/docker/libcontainer/libdevices.a $WORK/github.com/docker/libcontainer/libcgroups.a $WORK/github.com/docker/docker/pkg/libsysinfo.a $WORK/github.com/docker/docker/librunconfig.a $WORK/github.com/docker/docker/libimage.a $WORK/github.com/docker/docker/pkg/parsers/libfilters.a $WORK/github.com/tchap/go-patricia/libpatricia.a $WORK/github.com/docker/docker/pkg/libtruncindex.a $WORK/github.com/docker/docker/pkg/libhttputils.a $WORK/github.com/docker/docker/pkg/parsers/libkernel.a $WORK/github.com/docker/docker/pkg/libtarsum.a $WORK/github.com/gorilla/libcontext.a $WORK/github.com/gorilla/libmux.a $WORK/github.com/docker/docker/libregistry.a $WORK/github.com/docker/liblibtrust.a $WORK/github.com/docker/docker/libgraph.a $WORK/github.com/docker/docker/pkg/libsignal.a $WORK/github.com/docker/docker/pkg/libstdcopy.a $WORK/github.com/docker/docker/api/libclient.a $WORK/github.com/docker/docker/builder/libparser.a $WORK/github.com/syndtr/gocapability/libcapability.a $WORK/github.com/docker/libcontainer/security/libcapabilities.a $WORK/github.com/docker/docker/daemon/libexecdriver.a $WORK/github.com/docker/libcontainer/libsystem.a $WORK/github.com/docker/libcontainer/cgroups/libfs.a $WORK/github.com/godbus/libdbus.a $WORK/github.com/coreos/go-systemd/libdbus.a $WORK/github.com/docker/libcontainer/cgroups/libsystemd.a $WORK/github.com/docker/docker/pkg/libsymlink.a $WORK/github.com/docker/libcontainer/liblabel.a $WORK/github.com/docker/libcontainer/libconsole.a $WORK/github.com/docker/libcontainer/mount/libnodes.a $WORK/github.com/docker/libcontainer/libmount.a $WORK/github.com/docker/libcontainer/libnetlink.a $WORK/github.com/docker/libcontainer/libutils.a $WORK/github.com/docker/libcontainer/libnetwork.a $WORK/github.com/docker/liblibcontainer.a $WORK/github.com/docker/libcontainer/libapparmor.a $WORK/github.com/docker/docker/daemon/execdriver/native/libtemplate.a $WORK/github.com/docker/docker/libreexec.a $WORK/github.com/docker/libcontainer/security/librestrict.a $WORK/github.com/docker/libcontainer/libsyncpipe.a $WORK/github.com/docker/libcontainer/libuser.a $WORK/github.com/docker/libcontainer/libnamespaces.a $WORK/github.com/kr/libpty.a $WORK/github.com/docker/docker/daemon/execdriver/liblxc.a $WORK/github.com/docker/libcontainer/namespaces/libnsenter.a $WORK/github.com/docker/docker/daemon/execdriver/libnative.a $WORK/github.com/docker/docker/daemon/execdriver/libexecdrivers.a $WORK/github.com/docker/docker/daemon/graphdriver/libaufs.a $WORK/github.com/docker/docker/daemon/graphdriver/libbtrfs.a $WORK/github.com/docker/docker/daemon/graphdriver/libdevmapper.a $WORK/github.com/docker/docker/daemon/graphdriver/libvfs.a $WORK/github.com/docker/docker/daemon/libnetworkdriver.a $WORK/github.com/docker/docker/daemon/networkdriver/libipallocator.a $WORK/github.com/docker/docker/daemon/networkdriver/libportallocator.a $WORK/github.com/docker/docker/pkg/libiptables.a $WORK/github.com/docker/docker/pkg/libproxy.a $WORK/github.com/docker/docker/daemon/networkdriver/libportmapper.a $WORK/github.com/docker/docker/pkg/networkfs/libresolvconf.a $WORK/github.com/docker/docker/daemon/networkdriver/libbridge.a $WORK/github.com/docker/docker/liblinks.a $WORK/github.com/docker/docker/pkg/libjsonlog.a $WORK/github.com/docker/docker/pkg/libbroadcastwriter.a $WORK/code.google.com/p/gosqlite/libsqlite3.a $WORK/github.com/docker/docker/pkg/libgraphdb.a $WORK/github.com/docker/docker/pkg/libnamesgenerator.a $WORK/github.com/docker/docker/pkg/networkfs/libetchosts.a $WORK/github.com/docker/docker/pkg/parsers/liboperatingsystem.a $WORK/github.com/docker/docker/pkg/libtailfile.a $WORK/github.com/docker/libtrust/libtrustgraph.a $WORK/github.com/docker/docker/libtrust.a $WORK/github.com/docker/docker/libvolumes.a $WORK/github.com/docker/libcontainer/libselinux.a $WORK/github.com/docker/docker/libdaemon.a $WORK/github.com/docker/docker/libbuilder.a $WORK/code.google.com/p/go.net/libwebsocket.a $WORK/github.com/docker/docker/pkg/liblistenbuffer.a $WORK/github.com/coreos/go-systemd/libactivation.a $WORK/github.com/docker/docker/pkg/libsystemd.a $WORK/github.com/docker/docker/api/libserver.a $WORK/github.com/docker/docker/libevents.a $WORK/github.com/docker/docker/libbuiltins.a -L. -ldevmapper -lsqlite3 -Wl,-E -Wl,-) -static-libgo -static-libgcc
Created binary: /root/docker/bundles/1.3.1/binary-dryrun/docker-1.3.1

