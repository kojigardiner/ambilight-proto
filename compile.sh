#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "Usage: $0 <filename.proto>"
    exit 1
fi

SRC_DIR=.
DST_PY_DIR=../ambilight-server/src/proto
DST_C_DIR=../ambilight-client/src/proto
SRC=$1

echo "Writing python files"
protoc -I=$SRC_DIR --python_out=$DST_PY_DIR ./$SRC
echo "Writing c files"
./generator/nanopb_generator.py ./$SRC -D $DST_C_DIR