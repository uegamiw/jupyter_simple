FROM python:3.8-slim
USER root
WORKDIR /usr/src/app
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl && \
    apt-get clean

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