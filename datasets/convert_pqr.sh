#!/bin/bash
# Copyright 2018 The TensorFlow Authors All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
#
# Script to download and preprocess the PQR dataset.
#
# Usage:
#   bash ./convert_new_mnt.sh
#
# The folder structure is assumed to be:

  # + PQR
  #   + dataset
  #     + JPEGImages
  #     + SegmentationClass
  #     + ImageSets
  #     + Segmentation
  #   + tfrecord

# Exit immediately if a command exits with a non-zero status.
set -e

CURRENT_DIR=$(pwd)
WORK_DIR="./PQR"

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
PQR_ROOT="${WORK_DIR}/dataset"

SEG_FOLDER="${PQR_ROOT}/SegmentationClass"
SEMANTIC_SEG_FOLDER="${PQR_ROOT}/SegmentationClassRaw"

# Build TFRecords of the dataset.
OUTPUT_DIR="${WORK_DIR}/tfrecord"
mkdir -p "${OUTPUT_DIR}"

IMAGE_FOLDER="${PQR_ROOT}/JPEGImages"
LIST_FOLDER="${PQR_ROOT}/ImageSets"

echo "Converting PQR dataset..."
python ./build_pqr_data.py \
  --image_folder="${IMAGE_FOLDER}" \
  --semantic_segmentation_folder="${SEMANTIC_SEG_FOLDER}" \
  --list_folder="${LIST_FOLDER}" \
  --image_format="jpg" \
  --output_dir="${OUTPUT_DIR}"