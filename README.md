# deeplab
DeepLab is a semantic segmentation Deep Learning algorithm. Implementation is copied from tenserflow/../research/deeplab on GitHub.


> This is a self-help guide for using DeepLab model for semantic segmentation in TensorFlow. Github-TensorFlow has provided DeepLab model for research use.

## Installation
Download the DeepLab code:

https://github.com/tensorflow/models

## DeepLab depends on the following libraries
- Numpy
- Pillow 1.0
- tf-Slim (which is included in the `tensorflow/models/research/` checkout)
- Jupyter notebook
- Matplotlib
- Tensorflow

## Add Libraries to PYTHONPATH
When running locally, the tensorflow/models/research/ and slim directories should be appended to PYTHONPATH. This can be done by running the following from `tensorflow/models/research/`:

```
# From tensorflow/models/research/
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/deeplab
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/deeplab/slim
```

> Note: This command needs to run on every new terminal you start. If you wish to avoid running this manually, you can add it as a new line to the end of your `~/.bashrc` file.

## Testing the Installation
You can test if you have successfully installed the Tensorflow DeepLab by running the following commands:

A quick test by running `model_test.py`:

```
# From tensorflow/models/research/
python deeplab/model_test.py
```

Quick running the whole code on the PASCAL VOC 2012 dataset:

```
# From tensorflow/models/research/deeplab
sh local_test.sh
```
For more details visit: [Blog-post](https://beerensahu.wordpress.com/category/deep-learning/deeplab/)
