FROM centos:centos7.7.1908

RUN mkdir /app
WORKDIR /app

# Add enterprise linux repositories
RUN yum install -y epel-release

# Install g++ and git so we can grab and compile source
RUN yum install -y \
    gcc-c++ \
    git \
    cmake3 \
    make \
    && yum clean all

# Download JANA source
RUN git clone https://github.com/JeffersonLab/JANA2 /app/JANA2

# Set up environment variables
ENV JANA_HOME /app/jana_home
ENV JANA_PLUGIN_PATH /usr/lib64/jana/plugins:/plugins
ENV PATH ${PATH}:${JANA_HOME}/bin
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${JANA_PLUGIN_PATH}:${JANA_HOME}/lib:/usr/local/lib64
ENV BUILD_THREADS 4

# Install JANA2
RUN cd /app/JANA2 \
    && cmake3 -B build -DCMAKE_INSTALL_PREFIX=${JANA_HOME} \
    && cmake3 --build build -j${BUILD_THREADS} \
    && cmake3 --install build

ADD benchmark.sh /app/benchmark.sh
CMD /app/benchmark.sh
