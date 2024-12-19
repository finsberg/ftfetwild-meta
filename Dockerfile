# We choose ubuntu 22.04 as our base docker image

FROM dolfinx/dolfinx:v0.9.0
# We set the working directory to install docker dependencies
WORKDIR /tmp/

# Install all dependencies
RUN pip install --no-cache-dir h5py --no-binary=h5py
RUN pip install nibabel typer scikit-image pyvista meshio pyyaml
RUN python3 -m pip install --no-build-isolation git+https://github.com/scientificcomputing/scifem.git
# Change default gcc to 10 (needed for fTetWild)
RUN apt update && apt install -y software-properties-common libgmp3-dev
RUN echo | add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt update && apt install gcc-10 g++-10 -y
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10 --slave /usr/bin/g++ g++ /usr/bin/g++-10
RUN echo | update-alternatives --config gcc

# Clone and install wildmeshing-python package
RUN git clone https://github.com/wildmeshing/wildmeshing-python.git --recurse-submodules
RUN python3 -m pip install ./wildmeshing-python -vv

# We remove the contents of the temporary directory to minimize the size of the image
RUN rm -rf /tmp
