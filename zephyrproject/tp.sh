# Go to temp directory
cd /tmp

# Download Zephyr SDK v0.16.4 (latest stable compatible with nrf54l15dk)
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.16.4/zephyr-sdk-0.16.4_linux-x86_64.tar.xz

# Extract the SDK
tar xf zephyr-sdk-0.16.4_linux-x86_64.tar.xz

# Move it to /opt (standard location)
mv zephyr-sdk-0.16.4 /opt/zephyr-sdk

# Run the setup script
cd /opt/zephyr-sdk
./setup.sh -t all -c