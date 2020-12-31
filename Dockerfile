FROM nvcr.io/nvidia/mxnet:20.12-py3

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install moviepy flow-vis
