#!/bin/bash

set -euo pipefail

mrd_phantom -o mrd_testdata.h5
mrd_hdf5_to_stream mrd_testdata.h5 | mrd_stream_recon | mrd_stream_to_hdf5 mrd_testdata_recon.h5
