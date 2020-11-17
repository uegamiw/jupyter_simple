FROM python:3.8-slim

# update
RUN apt-get -y update && apt-get install -y \
    sudo \
    wget \
    curl \
    vim

# install nescessary packages
RUN python -m pip install --upgrade pip && pip install \
	pandas \
	numpy \
	tqdm \
	scipy \
	matplotlib \
        seaborn \
	ipython \
	scikit-learn \
	scikit-image \
	pillow \
	jupyterlab \
	opencv-python
  
WORKDIR /
RUN mkdir /work
 
# execute jupyterlab as a default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]

# example
# docker run -p 8889:8888 -v D:\UIP_study:/work --name jupyter jupyter_slim
