
MODALITY=$1

if [ ! -f models/c3d_${MODALITY}_1024_reference_model_120000.caffemodel ];then
	wget -P models/ http://107.191.107.239/caffemodel/c3d_${MODALITY}_1024_reference_model_120000.caffemodel
fi

mkdir -p LOG_TRAIN

GLOG_log_dir="./LOG_TRAIN" build/tools/caffe.bin train --solver=examples/c3d_finetuning/solver_${MODALITY}_1024.prototxt --weights=models/c3d_${MODALITY}_1024_reference_model_100000.caffemodel --gpu=0
