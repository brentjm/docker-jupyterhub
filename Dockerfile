FROM continuumio/miniconda3:latest

Label Brent Maranzano <Brent.Maranzano@pfizer.com>

# Install all OS dependencies for fully functional notebook server
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    git \
    nano \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install conda and Jupyter
RUN conda update -y conda
RUN conda install -c conda-forge jupyter_nbextensions_configurator \
    jupyterhub \
    jupyterlab \
    numpy \
    matplotlib \
    pandas \
    scipy \
    sympy \
    && conda clean -ay

# Install the R kernel
RUN conda install -c r r-irkernel

# Create users
RUN useradd --create-home --shell /bin/bash brent
RUN useradd --create-home --shell /bin/bash dean
RUN useradd --create-home --shell /bin/bash david

# Setup volumes
VOLUME /home/brent/notebooks
VOLUME /home/dean/notebooks
VOLUME /home/david/notebooks

# Copy in the JupyterHub configurations
COPY jupyterhub_config.py /

USER root
WORKDIR /

# Setup application
EXPOSE 8000

#CMD ["jupyterhub", "--ip='*'", "--port=8000", "--allow-root"]
CMD ["jupyterhub"]
