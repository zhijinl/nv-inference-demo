#! /bin/bash
## ---------------------------------------------------------------------------
##
## File: build-trt-llm.sh for Inference Demo
##
## Created by Zhijin Li
## E-mail:   <zhijinl@nvidia.com>
##
## Started on  Mon Feb 26 23:11:20 2024 Zhijin Li
## Last update Mon Feb 26 23:25:58 2024 Zhijin Li
## ---------------------------------------------------------------------------


docker build -t inference-demo-trt-llm-triton - < ./docker/dockerfile.trt-llm.triton
