FROM nvidia/cuda:12.6.1-devel-ubuntu24.04
ARG UID=1000
ARG GID=1000

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y sudo \
                                        build-essential \
                                        git \
                                        cmake

RUN userdel ubuntu

RUN addgroup --gid $GID ubuntu && \
    adduser --uid $UID --gid $GID --disabled-password --gecos "" ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

ENV HOME="/home/ubuntu"
RUN mkdir -p ${HOME}
WORKDIR ${HOME}

RUN echo ${HOME}

COPY NVIDIA-OptiX-SDK-*.sh ${HOME}
RUN chmod +x ${HOME}/NVIDIA-OptiX-SDK-*.sh

USER ${UID}:${GID}
RUN ${HOME}/NVIDIA-OptiX-SDK-*.sh --skip-license --include-subdir
RUN rm ${HOME}/NVIDIA-OptiX-SDK-*.sh

ENV OptiX_INSTALL_DIR=${HOME}/NVIDIA-OptiX-SDK-8.0.0-linux64-x86_64
ENV CPLUS_INCLUDE_PATH=${OptiX_INSTALL_DIR}/include