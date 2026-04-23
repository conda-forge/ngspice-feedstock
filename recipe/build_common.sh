#!/bin/bash
set -ex

./autogen.sh
mkdir -p ${PKG_NAME}-build
cd ${PKG_NAME}-build

if [[ ${PKG_NAME} == "ngspice-exe" ]]; then
    WITH_OPTION="--with-x"
else
    WITH_OPTION="--with-ngshared"
fi

../configure \
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
