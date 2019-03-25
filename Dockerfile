FROM continuumio/miniconda3:latest

Label Brent Maranzano <Brent.Maranzano@pfizer.com>

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    software-properties-common \
    git \
    nano \
    unzip \
    gnupg \
    r-base \
    octave \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install the CRAN version of R instead of package manager above
#ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
#RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
#RUN apt-get install -y r-base
##RUN apt-get install -y r-base

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

# Install the Octave kernel
RUN conda install -c conda-forge octave_kernel

RUN useradd --create-home --shell /bin/bash brent

# Copy in the JupyterHub configurations
COPY jupyterhub_config.py /

#COPY docker_configuration.sh /
#RUN chmod +x /docker_configuration.sh

# Setup application
EXPOSE 8000

CMD ["jupyterhub"]
