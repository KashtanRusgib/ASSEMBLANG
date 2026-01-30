#!/bin/bash

# Step 1: Ensure we're in the BitNet directory after cloning
# cd into BitNet if not already there

# Step 2: Install dependencies - Use Conda to create a new environment named bitnet-cpp with Python 3.9
# Activate the environment
# Install requirements from requirements.txt using pip

# Step 3: Install Clang >=18 if not present (for Ubuntu-based Codespace)
# Use apt to add LLVM repo and install clang-18, lld-18, etc.

# Step 4: Build the project using CMake internally via setup_env.py
# Note: The build integrates with llama.cpp submodule, so ensure submodules are initialized
# Run python setup_env.py with options to download and prepare the model

# Step 5: Download GGUF model from Hugging Face, e.g., 1bitLLM/bitnet_b1_58-3B
# Use huggingface-cli to download to models/bitnet_b1_58-3B
# Then run setup_env.py -md models/bitnet_b1_58-3B -q i2_s --quant-embd

# Step 6: If needed, convert safetensors to GGUF
# Download example model like microsoft/bitnet-b1.58-2B-4T-bf16
# Run convert-helper-bitnet.py on it

# Step 7: Test inference
# Run run_inference.py with the model, a prompt like "You are a helpful assistant", in chat mode


