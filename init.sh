#!/usr/bin/env bash
ollama serve &
sleep 2
ollama pull qwen2.5:0.5b
