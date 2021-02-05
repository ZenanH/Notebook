FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# Julia language environment variables
ENV JULIA_PATH /opt/julia
ENV PATH $JULIA_PATH/bin:$PATH
ENV JULIA_NUM_THREADS 100
# Anaconda environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

# apt update and install packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    bzip2 \
    ca-certificates \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git \
    mercurial \
    subversion \
&&  rm -rf /var/lib/apt/lists/* \
&&  apt-get clean

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy; \
    conda install -c conda-forge youtube-dl -y; \
    conda install -c conda-forge ffmpeg -y; \
    conda install -c conda-forge jupyterlab; \
    conda install -c conda-forge notebook; \
    pip install pyecharts; \
    conda update --all -y; \
    conda clean --all -y; \
    curl -fL -o julia.tar.gz "https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.3-linux-x86_64.tar.gz"; \
    mkdir "$JULIA_PATH"; \
  	tar -xzf julia.tar.gz -C "$JULIA_PATH" --strip-components 1; \
  	rm julia.tar.gz; \
    cd /opt/julia/etc/julia; \
    rm startup.jl; \
    wget https://raw.githubusercontent.com/ZenanH/Notebook/master/docker/startup.jl; \
    wget https://raw.githubusercontent.com/ZenanH/Notebook/master/docker/installation.jl; \
    julia installation.jl :NOCUDA; \
    rm installation.jl