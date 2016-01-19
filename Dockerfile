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

RUN pip3 install numpy
RUN pip3 install scipy

RUN pip3 install beautifulsoup4 \
    ftfy \
    ipython[all] \
    matplotlib \
    mysqlclient \
    numpy \
    pandas \
    python-igraph \
    scikit-learn 




# Set the timezone.
RUN sudo echo "Europe/Berlin" > /etc/timezone
RUN sudo dpkg-reconfigure -f noninteractive tzdata

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
