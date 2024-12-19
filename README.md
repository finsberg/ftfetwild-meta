# Meta repository for building docker image for ftetwild

The [wildmeshing-python](https://github.com/wildmeshing/wildmeshing-python) package is really useful for generating 3D meshes. However, it is not available on PyPI, and it is not trivial to build it from source. This repository provides a Dockerfile that builds the wildmeshing-python package from source, and makes it available as a Docker image together with other useful dependencies such as dolfinx, pyvista and scikit-image.
Please note that there is not way currently (to my knowledge) to build an ARM compatible version of the wildmeshing-python package, so this Dockerfile will only work on x86_64 architectures.
User with ARM architectures can still use the Dockerfile to build the other dependencies, but need to use emulation,  e.g
```
docker pull --platform linux/x86_64 ghcr.io/finsberg/ftfetwild-meta:main
```

