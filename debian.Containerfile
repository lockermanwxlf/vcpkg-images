FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install vcpkg
ENV VCPKG_ROOT=/usr/lib/vcpkg
WORKDIR $VCPKG_ROOT
RUN apt-get update && \
    apt-get install -y git curl zip unzip tar && \
    git clone https://github.com/microsoft/vcpkg . && \
    ./bootstrap-vcpkg.sh && \
    ln -s $VCPKG_ROOT/vcpkg /usr/bin/vcpkg