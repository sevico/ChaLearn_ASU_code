#!/usr/bin/env bash

DATASET=$1
MODALITY=$2

TOOLS=lib/caffe-action/build/install/bin
LOG_FILE=logs/${DATASET}_${MODALITY}_split2.log
N_GPU=1
MPI_BIN_DIR= #/usr/local/openmpi/bin/


echo "logging to ${LOG_FILE}"

${MPI_BIN_DIR}mpirun -np $N_GPU \
$TOOLS/caffe train --solver=models/${DATASET}/tsn_bn_inception_${MODALITY}_solver.prototxt --snapshot=models/IsoGD_split1_tsn_flow_bn_inception_iter_18000.solverstate \
   2>&1 | tee ${LOG_FILE}
   
   #--weights=models/ucf101_split_1_tsn_flow_reference_bn_inception.caffemodel 
