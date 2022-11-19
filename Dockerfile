FROM --platform=linux/amd64 rust:1.65.0

# System packages 
RUN apt-get update && apt-get install -y curl

# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b && \
    rm Miniconda3-latest-Linux-x86_64.sh

# configure & update conda
ENV PATH=/miniconda/bin:${PATH} \
    SHELL=/bin/bash
RUN conda init bash && \
    conda update -y conda && \
    conda install -c anaconda cmake -y && \
    conda install -y -c conda-forge nb_conda_kernels jupyterlab=3.5.0 theme-darcula  

# install evcxr_jupyter
## by setting GIT_FETCH_WITH_CLI option,
## Cargo will use the git executable to fetch registry indexes and git dependencies
RUN export CARGO_NET_GIT_FETCH_WITH_CLI=true && cargo install evcxr_jupyter && \    
    evcxr_jupyter --install

EXPOSE 8899

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8899", "--notebook-dir=/opt/notebooks", "--allow-root", "--no-browser"]
