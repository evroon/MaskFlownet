FROM nvcr.io/nvidia/mxnet:20.12-py3

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install moviepy flow-vis opencv-contrib-python
