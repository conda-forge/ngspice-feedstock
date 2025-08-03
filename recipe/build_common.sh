#!/bin/bash
set -ex

./autogen.sh

# --with-ngshared is always built, but since `ngspice-bin` depends
# on ngspice-lib, the "shared libraries" will only be included in the ngspice-lib package
if [[ ${PKG_NAME} == "ngspice-bin" ]]; then
    WITH_X="--with-x"
else
    WITH_X=""
fi

./configure \
    --prefix=${PREFIX} \
    --enable-xspice \
    --disable-debug \
    --disable-dependency-tracking \
    --enable-cider \
    --with-readline=yes \
    --enable-openmp \
    --with-ngshared \
    ${WITH_X}

# Not enabled for now:
#  --enable-adms
#
make install -j${CPU_COUNT}
