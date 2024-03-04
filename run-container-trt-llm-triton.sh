#! /bin/bash
## ---------------------------------------------------------------------------
##
## File: run-container-trt-llm-triton.sh for Inference Demo
##
## Created by Zhijin Li
## E-mail:   <zhijinl@nvidia.com>
##
## Started on  Mon Feb 26 16:13:09 2024 Zhijin Li
## Last update Mon Mar  4 17:32:01 2024 Zhijin Li
## ---------------------------------------------------------------------------


WDIR=$(pwd)

docker run --gpus all --ipc=host --net=host -it \
       -v ${WDIR}:/workspace \
       -w /workspace \
       inference-demo-trt-llm-triton \
       jupyter lab --ip 0.0.0.0 --no-browser --allow-root
