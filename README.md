# jupyter-rust Summary
A prototype docker container for jupyter lab with rust. Inspired by: [evcxr_jupyter](https://github.com/google/evcxr/blob/master/evcxr_jupyter/README.md) and [Data Analytics with Rust Notebooks](https://datacrayon.com/)

Work produced in the jupyter lab is saved in the `notebooks` directory. It persists after docker container is stopped.

This can be built on your local machine or you can [follow the instructions here](https://hub.docker.com/repository/docker/zie0/jupyter-rust) to download the image and launch the container in a couple of commands.

# Run already built images

docker run --name jupyter-rust -d -p 8899:8899 -v `pwd`:/opt/notebooks --platform=linux/amd64 davideuler/jupyter-rust:1.0

docker logs jupyter-rust

Then you can access the URL for jupyter with rust support as prompted by the running log of the application:
http://localhost:8899/lab?token=xxxxxxxx

# To Build

1. clone the repo

2. `docker-compose up`

3. open link > new > Rust

to change kernel
kernel > Change Kernel > (Rust|python3)

![](.jupyter-rust_helloWorld.gif)

# Build image by dockerfile only

docker build --platform linux/amd64 -t rust-jupyter .


# Image Details

Image components' versions:
* base docker image -> rust:1.65.0
* conda version -> 4.9.2 
* jupyter version -> 5.0.0
* evcxr_jupyter = "0.8.0"

## Jupyter Version Details
```
# jupyter --version
IPython          : 8.6.0
ipykernel        : 5.5.5
ipywidgets       : not installed
jupyter_client   : 7.0.6
jupyter_core     : 5.0.0
jupyter_server   : 1.23.2
jupyterlab       : 3.5.0
nbclient         : 0.7.0
nbconvert        : 7.2.5
nbformat         : 5.7.0
notebook         : 6.5.2
qtconsole        : not installed
traitlets        : 5.5.0
```
