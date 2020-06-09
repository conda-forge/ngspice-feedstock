# This is required for ngspice to find spinit
# (configure --enable-relpath does not work as expected, so we don't use it.)
export "SPICE_LIB_DIR=${CONDA_PREFIX}/share/ngspice"
