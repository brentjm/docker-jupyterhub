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

# Copy in the JupyterHub configurations
COPY jupyterhub_config.py /

# Create shared directory
RUN mkdir -p /home/shares
VOLUME /shares

# Create users
RUN useradd --create-home --shell /bin/bash brent --password PfizerJupyter
WORKDIR /home/brent
USER brent
RUN mkdir -p /home/brent/notebooks
VOLUME /home/brent/notebooks
RUN ln -s /shares

RUN useradd --create-home --shell /bin/bash dean --password PfizerJupyter
WORKDIR /home/dean
USER dean
RUN mkdir -p /home/dean/notebooks
VOLUME /home/dean/notebooks
RUN ln -s /shares

RUN useradd --create-home --shell /bin/bash david --password PfizerJupyter
WORKDIR /home/david
USER david
RUN mkdir -p /home/david/notebooks
VOLUME /home/david/notebooks
RUN ln -s /shares

# Setup application
EXPOSE 8000

#CMD ["jupyterhub", "--ip='*'", "--port=8000", "--allow-root"]
CMD ["jupyterhub"]
