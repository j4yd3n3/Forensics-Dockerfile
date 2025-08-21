# Use latest Kali as base
FROM kalilinux/kali-rolling 

# Set working directory
WORKDIR /challenge


# Update
RUN apt upgrade -y && apt update -y

# Core utilities & common forensic tools
RUN apt install tmux python3-pip python2.7 python2.7-dev python3 git curl  xxd exiftool file tcpdump pngcheck binwalk foremost apktool tshark steghide stegosuite outguess -y
RUN pip3 install uncompyle6 --break-system-packages 


# Archive and compression tools
RUN apt install zip unzip gzip tar -y
RUN pip3 install rarfile --break-system-packages

# Disk forensics
RUN apt install sleuthkit autopsy -y


# Install Volatility2
RUN cd /opt  && \
git clone https://github.com/volatilityfoundation/volatility.git && \
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && \
python2.7 get-pip.py && \
pip2 install distorm3 yara-python pycrypto

# Install Volatility3
RUN pip3 install volatility3 --break-system-packages


# Create Symbolic link to launch Volatility 2 and 3 easier
RUN sed -i '1s|.*|#!/usr/bin/env python2.7|' /opt/volatility/vol.py && \
    chmod +x /opt/volatility/vol.py && \
    ln -s /opt/volatility/vol.py /usr/local/bin/vol2
RUN ln -s /usr/local/bin/vol /usr/local/bin/vol3



# Cleanup
RUN apt -y autoremove && apt clean

