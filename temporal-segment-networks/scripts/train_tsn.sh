#!/usr/bin/env bash

DATASET=$1
MODALITY=$2

if [ ! -f models/IsoGD_split1_tsn_${MODALITY}_finetune_bn_inception_iter_100000.caffemodel ];then
	wget -P models/ http://107.191.107.239/caffemodel/IsoGD_split1_tsn_${MODALITY}_finetune_bn_inception_iter_100000.caffemodel
fi

TOOLS=lib/caffe-action/build/install/bin
LOG_FILE=logs/${DATASET}_${MODALITY}_split3.log
N_GPU=1
MPI_BIN_DIR= #/usr/local/openmpi/bin/


echo "logging to ${LOG_FILE}"

${MPI_BIN_DIR}mpirun -np $N_GPU \
$TOOLS/caffe train --solver=models/${DATASET}_${MODALITY}/tsn_bn_inception_${MODALITY}_solver.prototxt --weights=models/IsoGD_split1_tsn_${MODALITY}_finetune_bn_inception_iter_100000.caffemodel  \
   2>&1 | tee ${LOG_FILE}
   
   
