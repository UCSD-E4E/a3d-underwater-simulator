FROM nvidia/cuda:12.6.1-devel-ubuntu24.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y sudo \
                                        build-essential \
                                        git \
                                        cmake

RUN echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

ENV HOME="/home/ubuntu"
RUN mkdir -p ${HOME}
WORKDIR ${HOME}

RUN echo ${HOME}

COPY NVIDIA-OptiX-SDK-*.sh ${HOME}
RUN chmod +x ${HOME}/NVIDIA-OptiX-SDK-*.sh

USER ubuntu
RUN ${HOME}/NVIDIA-OptiX-SDK-*.sh --skip-license --include-subdir
RUN rm ${HOME}/NVIDIA-OptiX-SDK-*.sh

ENV PATH=/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}
ENV CPLUS_INCLUDE_PATH=/usr/local/cuda/include:${CPLUS_INCLUDE_PATH}

ENV OptiX_INSTALL_DIR=${HOME}/NVIDIA-OptiX-SDK-8.0.0-linux64-x86_64
ENV CPLUS_INCLUDE_PATH=${OptiX_INSTALL_DIR}/include:${CPLUS_INCLUDE_PATH}