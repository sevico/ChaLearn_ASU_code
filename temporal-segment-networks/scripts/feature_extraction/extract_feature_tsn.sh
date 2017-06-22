#!/usr/bin/env sh
# args for EXTRACT_FEATURE

export PYTHONPATH=.:..:/home/s03/lyn/temporal-segment-networks/lib/caffe-action/python/
#ln -s /home/tian/lyn/DeconvNet-master/caffe/examples/sketch/snapshot_nyu/
#ln -s /home/tian/lyn/DeconvNet-master/caffe/data/
TOOL=../../lib/caffe-action/build/install/bin
MODEL=../../models/IsoGD_split1_tsn_depth_fc_2s_iter_50000.caffemodel  #下载得到的caffe model
PROTOTXT=../../models/tsn_bn_inception_rgb_train_val_fc_2s.prototxt  # 网络定义
LAYER=reshape_fc249 # 提取层的名字，如提取fc7等
SUFFIX=flow-train1
LEVELDB=./flow/$LAYER-$SUFFIX # 保存的leveldb路径
BATCHSIZE=249




# args for LEVELDB to MAT
DIM=747  #4096 # 需要手工计算feature长度

OUT=./flow/$LAYER-$SUFFIX.mat #.mat文件保存路径
BATCHNUM=1 # 有多少个batch， 本例只有两张图， 所以只有一个batch

GLOG_logtostderr=1 $TOOL/extract_features  $MODEL $PROTOTXT $LAYER $LEVELDB $BATCHSIZE lmdb  GPU 0

python lmdb2mat.py $LEVELDB $BATCHNUM  $BATCHSIZE $DIM $OUT
