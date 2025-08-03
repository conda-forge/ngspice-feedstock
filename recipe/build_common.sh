#!/bin/bash
set -ex

./autogen.sh

# Seems like with-x and with-ngshared are mutually exclusive
if [[ ${PKG_NAME} != "ngspice-exe" ]]; then
    WITH_OPTION="--with-x"
else
    WITH_OPTION="--with-ngshared"
fi

./configure \
    --prefix=${PREFIX} \
    --enable-xspice \
    --disable-debug \
    --disable-dependency-tracking \
    --enable-cider \
    --with-readline=yes \
    --enable-openmp \
    ${WITH_OPTION}

# Not enabled for now:
#  --enable-adms
#
make -j${CPU_COUNT}
make install
