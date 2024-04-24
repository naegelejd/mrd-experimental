#!/bin/bash

set -euo pipefail

mkdir -p build-conda
cd build-conda

cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      ../

# ninja
# cd tests && ./test_ismrmrd && cd ../
ninja install
