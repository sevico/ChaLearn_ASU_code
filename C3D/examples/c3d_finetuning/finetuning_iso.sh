
MODALITY=$1

mkdir -p LOG_TRAIN

GLOG_log_dir="./LOG_TRAIN" build/tools/caffe.bin train --solver=examples/c3d_finetuning/solver_${MODALITY}_1024.prototxt --weights=models/c3d_${MODALITY}_1024_reference_model_100000.caffemodel --gpu=0
