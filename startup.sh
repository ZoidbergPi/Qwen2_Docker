#!/usr/bin/env bash
ollama serve &
OLLAMA_PID=$!
sleep 2
ollama run qwen2.5:0.5b
wait $OLLAMA_PID
