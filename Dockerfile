FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required system packages
RUN apt-get update && \
    apt-get install -y \
    python3 python3-pip \
    ninja-build cmake git gperf \
    dfu-util device-tree-compiler \
    wget xz-utils file && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install --upgrade west pyelftools intelhex

# Install Zephyr SDK v0.16.4
RUN wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.16.4/zephyr-sdk-0.16.4_linux-x86_64.tar.xz && \
    tar -xf zephyr-sdk-0.16.4_linux-x86_64.tar.xz -C /opt && \
    rm zephyr-sdk-0.16.4_linux-x86_64.tar.xz && \
    cd /opt/zephyr-sdk-0.16.4 && \
    ./setup.sh -t arm-zephyr-eabi

# Set environment variables
ENV ZEPHYR_TOOLCHAIN_VARIANT=zephyr
ENV ZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk-0.16.4

# Default working directory
WORKDIR /workdir/project
