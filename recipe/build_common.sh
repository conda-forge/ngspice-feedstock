#!/bin/bash
set -ex

./autogen.sh

./configure \
    --prefix=${PREFIX} \
    --enable-xspice \
    --disable-debug \
    --disable-dependency-tracking \
    --enable-cider \
    --with-readline=yes \
    --enable-openmp \
    --with-ngshared \
    --with-x

# Not enabled for now:
#  --enable-adms
#
make -j${CPU_COUNT}
make install

# Binary is always built, but if we are building the "library only"
# remove it from the install directory so it doesn't get packaged up
if [[ ${PKG_NAME} != "ngspice-exe" ]]; then
    rm -f ${PREFIX}/bin/ngspice
fi
