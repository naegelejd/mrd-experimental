#!/bin/bash

set -euo pipefail

mkdir -p build-conda
cd build-conda

if [[ $(uname) == Darwin ]]; then
    export CXXFLAGS="${CXXFLAGS} -isysroot ${CONDA_BUILD_SYSROOT} -mmacosx-version-min=${MACOSX_DEPLOYMENT_TARGET}"
fi

cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      ../

# ninja
# cd tests && ./test_ismrmrd && cd ../
ninja install
