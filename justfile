set shell := ['bash', '-ceuo', 'pipefail']

cpp_version := "17"

matlab := "disabled"
matlab-test-cmd := if matlab != "disabled" { "run-matlab-command buildtool" } else { "echo Skipping MATLAB tests..." }
cross-recon-test-cmd := if matlab != "disabled" { "./test.sh" } else { "echo Skipping cross-language reconstruction test..." }

@default: test

@ensure-build-dir:
    mkdir -p cpp/build

@configure: ensure-build-dir
    cd cpp/build; \
    cmake -GNinja -D CMAKE_CXX_STANDARD={{ cpp_version }} ..

@build: configure generate
    cd cpp/build && ninja

@convert-xsd:
    wget -O ismrmrd.xsd https://raw.githubusercontent.com/ismrmrd/ismrmrd/master/schema/ismrmrd.xsd
    python utils/xsd-to-yardl.py ismrmrd.xsd > model/mrd_header.yml
    rm ismrmrd.xsd

@generate:
    cd model && yardl generate

@converter-roundtrip-test: build
    cd cpp/build; \
    rm -f roundtrip.h5; \
    rm -f roundtrip.bin; \
    rm -f direct.bin; \
    rm -f recon_direct.bin; \
    rm -f recon_rountrip.bin; \
    ismrmrd_generate_cartesian_shepp_logan -o roundtrip.h5; \
    ismrmrd_hdf5_to_stream -i roundtrip.h5 --use-stdout | ./ismrmrd_to_mrd | ./mrd_to_ismrmrd > roundtrip.bin; \
    ismrmrd_hdf5_to_stream -i roundtrip.h5 --use-stdout > direct.bin; \
    ismrmrd_hdf5_to_stream -i roundtrip.h5 --use-stdout | ./ismrmrd_to_mrd > mrd_testdata.bin; \
    ismrmrd_hdf5_to_stream -i roundtrip.h5 --use-stdout | ismrmrd_stream_recon_cartesian_2d --use-stdin --use-stdout > recon_direct.bin; \
    ismrmrd_hdf5_to_stream -i roundtrip.h5 --use-stdout | ismrmrd_stream_recon_cartesian_2d --use-stdin --use-stdout | ./ismrmrd_to_mrd | ./mrd_to_ismrmrd > recon_rountrip.bin; \
    diff direct.bin roundtrip.bin & diff recon_direct.bin recon_rountrip.bin

@conda-cpp-test: build
    cd cpp/build; \
    PATH=./:$PATH ../conda/run_test.sh

@conda-python-test: generate
    cd python; \
    ./conda/run_test.sh

@matlab-test: generate
    cd matlab; \
    {{ matlab-test-cmd }}

@cross-language-recon-test: build
    cd test; \
    {{ cross-recon-test-cmd }}

@test: build converter-roundtrip-test conda-cpp-test conda-python-test matlab-test cross-language-recon-test

@validate: test

validate-with-no-changes: validate
    #!/usr/bin/env bash
    set -euo pipefail

    if [[ `git status --porcelain` ]]; then
      echo "ERROR: Found uncommitted changes:"
      git status --porcelain
      exit 1
    fi


build-conda-packages:
    bash -il ./utils/conda/mrd_package_all.sh

build-matlab-toolbox:
    matlab -sd ./matlab -batch "buildtool"

build-pypi-package:
    ./utils/pypi/package.sh
