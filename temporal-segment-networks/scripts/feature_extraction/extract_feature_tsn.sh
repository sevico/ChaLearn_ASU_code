#!/usr/bin/env sh
# args for EXTRACT_FEATURE

export PYTHONPATH=.:..:./lib/caffe-action/python/
#ln -s /home/tian/lyn/DeconvNet-master/caffe/examples/sketch/snapshot_nyu/
#ln -s /home/tian/lyn/DeconvNet-master/caffe/data/

MODALITY=flow

TOOL=lib/caffe-action/build/install/bin
MODEL=models/IsoGD_split1_tsn_${MODALITY}_finetune_bn_inception_iter_100000.caffemodel  #下载得到的caffe model
PROTOTXT=models/IsoGD_${MODALITY}/tsn_bn_inception_${MODALITY}_train_val.prototxt  # 网络定义
LAYER=fc6 # 提取层的名字，如提取fc7等

SUFFIX=$MODALITY-train
LEVELDB=./scripts/feature_extraction/$MODALITY/$LAYER-$SUFFIX # 保存的leveldb路径
BATCHSIZE=107634 # 35878*3




# args for LEVELDB to MAT
DIM=2048  #4096 # 需要手工计算feature长度

OUT=./scripts/feature_extraction/$MODALITY/$LAYER-$SUFFIX.mat #.mat文件保存路径
BATCHNUM=1 # 有多少个batch， 本例只有两张图， 所以只有一个batch

GLOG_logtostderr=1 $TOOL/extract_features  $MODEL $PROTOTXT $LAYER $LEVELDB $BATCHSIZE lmdb  GPU 0

python ./scripts/feature_extraction/lmdb2mat.py $LEVELDB $BATCHNUM  $BATCHSIZE $DIM $OUT
