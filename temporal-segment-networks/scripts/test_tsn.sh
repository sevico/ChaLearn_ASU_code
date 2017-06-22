#!/usr/bin/env bash

DATASET=$1

TOOLS=lib/caffe-action/build/install/bin
#LOG_FILE=logs/${DATASET}_${MODALITY}_split1_fc1.log
N_GPU=1
MPI_BIN_DIR= #/usr/local/openmpi/bin/


#echo "logging to ${LOG_FILE}"

${MPI_BIN_DIR}mpirun -np $N_GPU \
$TOOLS/caffe test -model=models/${DATASET}/tsn_bn_inception_flow_train_val.prototxt  \
  -weights=models/${DATASET}/IsoGD_split1_tsn_flow_finetune_bn_inception_iter_50000.caffemodel  -iterations=5784 -gpu=0
  #--gpu =0

