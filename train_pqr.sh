# Usage:
#   # From the /DeepLab/ directory.
#   sh ./train_pqr.sh
#
#

# Exit immediately if a command exits with a non-zero status.
set -e

WD=`pwd`

# # Move one-level up to tensorflow/models/research directory.
cd ..

# Update PYTHONPATH.
# export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
export PYTHONPATH=$PYTHONPATH:`pwd`:$WD/slim

# # Set up the working environment.
CURRENT_DIR=$(pwd)
WORK_DIR="${CURRENT_DIR}/deeplab"


DATASET_DIR="datasets"

# Set up the working directories.
PQR_FOLDER="PQR"
EXP_FOLDER="exp/train_on_trainval_set" # Experiment folder
INIT_FOLDER="${WORK_DIR}/${DATASET_DIR}/init_models"
TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PQR_FOLDER}/${EXP_FOLDER}/train"
EVAL_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PQR_FOLDER}/${EXP_FOLDER}/eval"
VIS_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PQR_FOLDER}/${EXP_FOLDER}/vis"
EXPORT_DIR="${WORK_DIR}/${DATASET_DIR}/${PQR_FOLDER}/${EXP_FOLDER}/export"

MY_DATASET="${WORK_DIR}/${DATASET_DIR}/${PQR_FOLDER}/tfrecord"

TF_CHECKPOINT="${INIT_FOLDER}/deeplabv3_pascal_train_aug/model.ckpt"

echo "==================  Training  ======================="
echo "==================  ${PQR_FOLDER}"

echo "${WORK_DIR}/${DATASET_DIR}/${PQR_FOLDER}/exp"

mkdir -p "${WORK_DIR}/${DATASET_DIR}/${PQR_FOLDER}/exp"
mkdir -p "${TRAIN_LOGDIR}"

# Train 10 iterations.
NUM_ITERATIONS=5
LOG_STEPS=1
SAVE_INT=7200
SAVE_SUM=7200
python "${WORK_DIR}"/train.py \
  --logtostderr \
  --train_split="train" \
  --model_variant="xception_65" \
  --atrous_rates=6 \
  --atrous_rates=12 \
  --atrous_rates=18 \
  --output_stride=16 \
  --decoder_output_stride=4 \
  --train_crop_size=513 \
  --train_crop_size=513 \
  --train_batch_size=4 \
  --training_number_of_steps="${NUM_ITERATIONS}" \
  --fine_tune_batch_norm=true \
  --tf_initial_checkpoint="${TF_CHECKPOINT}" \
  --log_steps="${LOG_STEPS}" \
  --save_interval_secs="${SAVE_INT}" \
  --save_summaries_secs="${SAVE_SUM}" \
  --train_logdir="${TRAIN_LOGDIR}" \
  --dataset_dir="${MY_DATASET}"
  #--tf_initial_checkpoint="${INIT_FOLDER}/deeplabv3_pascal_train_aug/model.ckpt" \
  #--tf_initial_checkpoint="${TRAIN_LOGDIR}/model.ckpt-50" \
  # --initialize_last_layer=False \
  # --last_layers_contain_logits_only=True \