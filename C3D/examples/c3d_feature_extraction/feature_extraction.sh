#!/usr/bin/env bash

MODALITY=$1
PHASE=$2



if [ ! -f models/c3d_${MODALITY}_1024_reference_model_120000.caffemodel ];then
	wget -P models/ http://107.191.107.239/caffemodel/c3d_${MODALITY}_1024_reference_model_120000.caffemodel
fi


if  [ $PHASE == 'train' ]; then
     num=35878
     echo $num 'batches for train data'
fi


if  [ $PHASE == 'test' ]; then
     num=6271
     echo $num 'batches for test data'
fi

GLOG_logtostderr=1 build/tools/extract_image_features.bin examples/c3d_feature_extraction/extract_${PHASE}_${MODALITY}_1024.prototxt models/c3d_${MODALITY}_1024_reference_model_120000.caffemodel 0 1 ${num} examples/c3d_feature_extraction/output_dest/${PHASE}_${MODALITY}_32frames_whole_output.txt  pool5 
