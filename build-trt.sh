#! /bin/bash
## ---------------------------------------------------------------------------
##
## File: build-trt.sh for Inference Demo
##
## Created by Zhijin Li
## E-mail:   <zhijinl@nvidia.com>
##
## Started on  Mon Feb 26 15:57:41 2024 Zhijin Li
## Last update Mon Feb 26 16:01:55 2024 Zhijin Li
## ---------------------------------------------------------------------------


docker build -t inference-demo-trt - < ./docker/dockerfile.trt
