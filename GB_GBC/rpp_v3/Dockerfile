FROM rgbds
RUN git clone --recursive https://github.com/geekgit/rpp-backup
RUN mv rpp-backup rpp
WORKDIR /home/build/rpp
RUN git submodule init
RUN git submodule update
RUN make
RUN mv *blue.gbc rpp_b.gbc && mv *red.gbc rpp_r.gbc
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
