# Brief
The goal is to deploy any Ollama-supported model to a network-free environment.

this is a simply version, use offical Ollama Image as the base image

# Usage
1. Change the model both in startup.sh and init.sh, qwen2.5:0.5b to any Ollama model you want.

2. Build the dockerfile as normal in networkable environment, this Dockerfile will download the model from Ollama server   `` docker build . -t qwensmall ``
  
4. Use Docker export command to save the generated image as file ``docker save  -o qwensmall qwensmall``

5. Copy the file to network-free environment and use Docker image load command ``docker load --input qwensmall``

6. Run the image as container ``docker run -d --gpus=all -p 11434:11434 --restart="always" --name qwen qwensmall``

7. Use it as you want

``
curl http://localhost:11435/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "qwen2.5:0.5b",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user",
                "content": "Hello!"
            }
        ]
    }'
  ``
