# deeplab
DeepLab is a semantic segmentation Deep Learning algorithm. Implementation is copied from tenserflow/../research/deeplab on GitHub.


> This is a self-help guide for using DeepLab model for semantic segmentation in TensorFlow. Github-TensorFlow has provided DeepLab model for research use.

## Installation
Download the DeepLab code:

https://github.com/tensorflow/models

## DeepLab depends on the following libraries
- Numpy
- Pillow 1.0
- Jupyter notebook
- Matplotlib
- Tensorflow

## Pre-trained model
We have used the the frozen graph trained on PASCAL VOC 2012 Semantic Segmentation Dataset.
You can down load this from [download.tensorflow.org/models/deeplabv3_pascal_train_aug_2018_01_04.tar.gz](download.tensorflow.org/models/deeplabv3_pascal_train_aug_2018_01_04.tar.gz)

On extracting the above frozen graph, you will get a file named "frozen_inference_graph.pb" inside it. Copy this file to deeplab/datasets/init_models/.

For more details visit: [Blog-post](https://beerensahu.wordpress.com/category/deep-learning/deeplab/)
