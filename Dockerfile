FROM ubuntu:14.04.2
MAINTAINER crs

# install required system packages
RUN apt-get update -y
RUN apt-get install -y build-essential \
    curl \
    gfortran \
    git \
    libatlas3-base \
    libfreetype6-dev \
    libjpeg8-dev \
    liblapack-dev \
    libmysqlclient-dev \
    libopenblas-base \
    libopenblas-dev \
    libpng-dev \
    libxml2-dev \
    libzmq-dev \
    pkg-config \
    python3-dev \
    python3-pip \
    vim \
    wget


RUN pip3 install beautifulsoup4==4.3.2 \
    ftfy==4.0.0 \
    ipython[all]==3.1.0 \
    matplotlib==1.4.3 \
    mysqlclient==1.3.6 \
    numpy==1.9.2 \
    pandas==0.16.1 \
    python-igraph==0.7.1-4 \
    scikit-learn==0.16.1 \
    scipy==0.15.1




RUN ln -s /usr/bin/python3 /usr/bin/python
#run as non-privileged user and chown dir
RUN echo "root:root" | chpasswd
RUN mkdir -p /notebooks

# directory for notebooks
VOLUME /notebooks
WORKDIR /notebooks/

ADD test_notebook.ipynb test_notebook.ipynb

RUN useradd -m -s /bin/bash jupyter
USER jupyter
ENV HOME /home/jupyter
ENV SHELL /bin/bash
ENV USER jupyter
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
EXPOSE 8888
CMD ipython notebook --no-browser --ip=0.0.0.0
