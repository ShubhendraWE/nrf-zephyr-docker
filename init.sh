#!/bin/bash
rm -rf zephyrproject
west init -m https://github.com/nrfconnect/sdk-nrf --mr v2.9.1 zephyrproject
cp -r app zephyrproject/
cd zephyrproject
west update