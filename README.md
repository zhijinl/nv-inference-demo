# NVIDIA Inference Stack Demos

This repository contains demos using NVIDIA's inference SW stack
- TensorRT
- TensorRT-LLM
- Triton-Inference-Server

**Note: do not change the structure of this repository when running
the demos. Many scripts rely on relative paths of files. If modified,
the demos might not work.**


## Installation & Environment Set-up


### TensorRT Demo

Run the following script to install dependencies for TensorRT demo
```
./build-trt.sh
```
This will pull the `pytorch:24.01-py3` container from NGC that
contains the latest `TensorRT` GA version 8.6.1, and
`Pytorch-2.2.0a0+81ea7a4`. This will also install the current release
of `MONAI`, needed to download and load the model used for the
TensorRT demo.

#### GPU Requirements

This demo was tested with RTX 6000 (Turing) and A100 GPUs. For a list
of supported GPU devices, refer to [TensorRT support matrix
page](https://docs.nvidia.com/deeplearning/tensorrt/support-matrix/index.html).


### TensorRT-LLM and Triton Demo

Run the following script to install dependencies for tRT-LLM and
Triton demo.
```
build-trt-llm-triton.sh
```
This will pull the `tritonserver:23.10-trtllm-python-py3` container
from NGC that contains a special build of Triton Inference Server for
TensorRT-LLM v0.5.0. This will also install dependencies required for
running the demo.

**Note: currently this demo only works on TensorRT-LLM v0.5.0 release,
updating to the most recent TensorRT-LLM release is on-going**

For this demo, it is also recommended to download the
`llamma-2-7b-chat` model from Meta, and put the model inside the
`notebooks/tensorrt-llm/llama-models` folder. For this you need to go
to the models [website](https://llama.meta.com/llama-downloads),
register, then an email with a custom URL will be sent to you allowing
you to download the llama models.

To proceed with the download, first clone the llama repo, then launch
the download script. When prompt with URL, just enter the URL that you
received via email before. For this tutorial, we will need to download
1 model: the 7B-chat. Put the downloaded model inside
`notebooks/tensorrt-llm/llama-models` folder.

**Note: the download could take some time.**

#### GPU Requirements

This demo was tested with A100 GPU. Currently TensorRT-LLM supports
the following GPU models: H100, A100, A30, A10, L40, L40s, L4. Support
for Turing T4 and Volta V100 is experimental.


## Running the Demos

### TensorRT Demo

Run the following script to start the TensorRT demo
```
./run-container-trt.sh
```
This automatically start a `jupyter lab` instance. Open the jupyter
lab in a local / remote browser, then open the
`notebooks/tensorrt/demo-trt.ipynb`, follow the descriptions in this
notebook to run through the demo.

In this demo you will play with:
- Converting a pytorch model to TensorRT through onnx format
- Tools to interact with TensorRT models, notably Polygraphy
- Running inference with TensorRT models using Polygraphy CLI and Python API
- Benchmark inference speed performance of TensorRT models


### TensorRT-LLM and Triton Demo

This demo is adapted from in-part from the [ai-pulse event
demo](https://github.com/scaleway/ai-pulse-nvidia-trt-llm/tree/main)
by Scaleway. Please refer to the original demo for a more complete
description.

Run the following script to start the TensorRT-LLM and Triton demo
```
./run-container-trt-llm-triton.sh
```
This automatically start a `jupyter lab` instance. Open the jupyter
lab in a local / remote browser, then open the
`notebooks/tensorrt-llm/demo-trt-llm.ipynb`, follow the descriptions in this
notebook to run through the demo.

In this demo you will play with:
- How to convert llama 2 models to TensorRT-LLM format
- Set-up Triton Inference Server with llama 2 models optimized using
  TensorRT-LLM
- Benchmark the inference performance of Triton + TensorRT-LLM
  pipeline vs vanilla Python HuggingFace pipeline
