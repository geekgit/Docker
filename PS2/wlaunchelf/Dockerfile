FROM ps2dev
WORKDIR /home/build
RUN git clone https://github.com/ps2homebrew/wLaunchELF
WORKDIR /home/build/wLaunchELF
RUN make
ENTRYPOINT ["/bin/bash"]
