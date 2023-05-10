FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel

ENV DEBIAN_FRONTEND=noninteractive PIP_PREFER_BINARY=1

RUN apt -y update && apt -y install git vim less python3-pip wget curl libgl1-mesa-dev libglib2.0-0
#libopencv-dev 全部はインストールする必要なし

#RUN pip3 install git+https://github.com/facebookresearch/xformers.git@xformers

WORKDIR /app
COPY ./ /app
RUN pip3 install --upgrade -r requirements.txt

# sudo docker build -t tuning .
# sudo docker run --gpus all -it --rm -v ~/sd-scripts:/app -v ~/stable-diffusion-webui-docker/data:/data tuning /bin/bash
