#!/bin/bash
set -x

./autogen.sh
./configure --prefix=${PREFIX}

make -j${CPU_COUNT}
# can't run checks when cross-compiling
if [[ $CONDA_BUILD_CROSS_COMPILATION != "1" ]]; then
  make check
fi
make install
