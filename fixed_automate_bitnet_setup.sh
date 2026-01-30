#!/bin/bash

# Set log file and redirect output
# exec > setup.log 2>&1

# Navigate to BitNet dir from ASSEMBLANG root
# cd BitNet || { echo "Failed to cd into BitNet"; exit 1; }

# Pull latest repo changes to get bug fixes (e.g., setup_env.py COMPILER_EXTRA_ARGS)
# git pull origin main

# Add conda channels if not set
# conda config --add channels conda-forge
# conda config --add channels defaults

# Create and activate conda env with Python 3.9 (official recommendation)
# conda create -n bitnet-cpp python=3.9 -y
# conda activate bitnet-cpp

# Uninstall old packages and install requirements + extras (Torch for any conversions, latest HF)
# pip uninstall -y huggingface-hub hf-xet typer-slim shellingham click
# pip install -r requirements.txt --upgrade
# pip install torch "huggingface_hub[cli]" --upgrade --force-reinstall

# Update llama.cpp submodule to latest (commit ~1876a3e as per README)
# git submodule update --init --recursive
# cd 3rdparty/llama.cpp
# git checkout master
# git pull origin master
# cd ../..

# Apply std::chrono patch from tinglou/llama.cpp commit 4e3db1e3d78cc1bcd22bcb3af54bd2a4628dd323
# cd 3rdparty/llama.cpp
# git remote add tinglou https://github.com/tinglou/llama.cpp.git || true
# git fetch tinglou
# git cherry-pick 4e3db1e3d78cc1bcd22bcb3af54bd2a4628dd323 || echo "Patch applied or already present"
# cd ../..

# Download pre-converted GGUF model (avoids conversion errors)
# mkdir -p models/BitNet-b1.58-3B-gguf
# huggingface-cli download microsoft/BitNet-b1.58-3B-gguf --local-dir models/BitNet-b1.58-3B-gguf

# Auto-edit setup_env.py if NotImplementedError (comment out raise, add pass at line ~200)
# sed -i 's/raise NotImplementedError()/# raise NotImplementedError()\n    pass/' setup_env.py

# Run setup_env.py for build and quantization (use i2_s as recommended)
# python setup_env.py -md models/BitNet-b1.58-3B-gguf -q i2_s --quant-embd

# Test inference with demo prompt
# python run_inference.py -m models/BitNet-b1.58-3B-gguf/ggml-model-i2_s.gguf -p "Write an essay about ecosystem" -t 12 -n 900

# Check for errors and cat compile.log if build failed
# if [ $? -ne 0 ]; then cat logs/compile.log; fi
# echo "Setup complete! Check setup.log for details."
