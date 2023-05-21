FROM ps2dev
WORKDIR /home/build
RUN git clone https://github.com/ps2homebrew/Open-PS2-Loader
WORKDIR /home/build/Open-PS2-Loader
USER root
RUN apt-get install -y gawk python3 python3-pip
RUN pip3 install -r requirements.txt
USER build
ENV BaseCommit 0a477b2443ad50005cec45dad508758939d2f17d
ENV PullNumber 952
ENV PatchUrl https://patch-diff.githubusercontent.com/raw/ps2homebrew/Open-PS2-Loader/pull/$PullNumber.patch
RUN git reset --hard "${BaseCommit}"
RUN git stash
RUN wget  --secure-protocol=TLSv1_2 --https-only "${PatchUrl}" -O "${PullNumber}.patch"
RUN git apply "${PullNumber}.patch"
RUN make
ENTRYPOINT ["/bin/bash"]
