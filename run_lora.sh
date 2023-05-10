#!/bin/bash

accelerate launch --num_cpu_threads_per_process 1 train_network.py \
    --pretrained_model_name_or_path="/data/StableDiffusion/coremixpure_v10.safetensors" \
    --dataset_config="lora_scz.toml" \
    --output_dir="/app/out/" \
    --output_name="scz" \
    --save_model_as=safetensors \
    --prior_loss_weight=1.0 \
    --max_train_steps=1500 \
    --learning_rate=1e-4 \
    --optimizer_type="AdamW8bit" \
    --mixed_precision="no" \
    --cache_latents \
    --gradient_checkpointing \
    --save_every_n_epochs=3 \
    --xformers \
    --network_module=networks.lora
