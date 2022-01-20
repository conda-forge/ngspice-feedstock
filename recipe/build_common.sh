#!/bin/bash

set -x
set -e

# Used by autotools AX_PROG_CC_FOR_BUILD
export CC_FOR_BUILD=${CC}

./autogen.sh

configure_args=(
  --prefix=${PREFIX}
  --enable-xspice
  --disable-debug
  --enable-cider
  --with-readline=yes
  --enable-openmp

  # Not enabled for now:
  #  --enable-adms
)

export LDFLAGS="${LDFLAGS} -m64"

if [[ ! -z "${BUILD_NGSPICE_LIB}" && ! -z "${BUILD_NGSPICE_EXE}" ]]; then
  2>&1 echo "Set either BUILD_NGSPICE_LIB or BUILD_NGSPICE_EXE"
  exit 1
fi

if [[ ! -z "${BUILD_NGSPICE_LIB}" ]]; then
  #
  # build libngspice.dylib
  #
  mkdir release-lib && cd release-lib
  ../configure "${configure_args[@]}" --with-ngshared LDFLAGS="${LDFLAGS}"
  make -j${CPU_COUNT}
  make install
  cd -
fi

if [[ ! -z "${BUILD_NGSPICE_EXE}" ]]; then
  #
  # build ngspice executable
  #
  mkdir release-bin && cd release-bin
  ../configure "${configure_args[@]}" --with-x LDFLAGS="${LDFLAGS}"
  make -j${CPU_COUNT}
  make install
  cd -
fi
