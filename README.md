# Docker base image of JupyterHub and JupyterLab

A JupyterHub instance running in a Docker container. The 
docker container is based on the miniconda container. The JupyterLab
instances provide the Python 3 and R kernels installed using the 
conda package manager.

## Getting started

### Clone this repo: 
https://github.com/brentjm/docker-jupyterhub.git

### Configure the Dockerfile
Add/remove kernels by editing the Dockerfile
Add/remove user accounts by editing the Dockerfile

### Build the image

```bash
docker build -t juypterhub .
```

### Run the image

```bash
docker run -p 8000:8000 -d --name jupyterhub jupyterhub
```

## Find your data
```bash
docker volume ls
```

```bash
docker volume inspect <volume_name>
```

## Configure the JuyterHub instance
The JupyterHub instance can be configured by editing the jupyterhub_config.py file
see [Configuration Basics](https://jupyterhub.readthedocs.io/en/stable/getting-started/config-basics.html)

## Acknowledgements
based off of the deployment from [Joerg Klein](https://github.com/joergklein/docker-jupyterhub)

## License
MIT
