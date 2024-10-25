#!/usr/bin/env bash
MODELSCOPE_CACHE='qwen2-7b-instruct' python -m vllm.entrypoints.openai.api_server \
    --model qwen/Qwen2-7B-Instruct --dtype=half --max-model-len 8192  --gpu-memory-utilization 0.95
wait