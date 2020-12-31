#!/bin/bash

if [[ -z "${DATASET_DIR}" ]]; then
    echo "Environment variable 'DATASET_DIR' does not exist."
    echo "Please set it in ~/.bashrc using: 'export DATASET_DIR=/path/to/DATASET_DIR'"
    exit 1
fi

COMMAND="/bin/bash"

while test $# -gt 0
do
    case "$1" in
        --run) COMMAND="run.sh"
            ;;
    esac
    shift
done

sudo nvidia-docker run  --gpus all \
                        --rm -ti \
                        --volume=$(pwd):/maskflownet:rw \
                        -v $DATASET_DIR:/data/frames \
                        --workdir=/maskflownet \
                        --ipc=host $USER/maskflownet:latest \
                        $COMMAND
