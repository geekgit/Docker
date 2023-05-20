FROM ps2dev
WORKDIR /home/build
RUN git clone https://github.com/ps2homebrew/Open-PS2-Loader
WORKDIR /home/build/Open-PS2-Loader
USER root
RUN apt-get install -y gawk python3 python3-pip
RUN pip3 install -r requirements.txt
USER build
RUN make
ENTRYPOINT ["/bin/bash"]
