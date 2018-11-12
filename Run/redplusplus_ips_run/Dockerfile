FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential sudo unzip wget
RUN apt-get install -y git
RUN apt-get install -y uuid-runtime
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
RUN adduser --disabled-password --gecos '' user
# 
RUN pip install python-ips
#
USER user
WORKDIR /home/user
USER root
ADD source.gb source.gb
RUN chmod a+rwx *.gb
RUN chown user:user *.gb
USER user
RUN wget --secure-protocol=TLSv1_2 --https-only "https://github.com/cirnobaka99999/RedPlusPlus/releases/download/v2.4.2/RedPlusPlus_v2.4.2_Normal.ips"
RUN wget --secure-protocol=TLSv1_2 --https-only "https://github.com/cirnobaka99999/RedPlusPlus/releases/download/v2.4.2/RedPlusPlus_v2.4.2_Hard.ips"
RUN cp source.gb RedPlusPlus_v2.4.2_Normal.gb
RUN cp source.gb RedPlusPlus_v2.4.2_Hard.gb
RUN python-ips RedPlusPlus_v2.4.2_Normal.ips RedPlusPlus_v2.4.2_Normal.gb
RUN python-ips RedPlusPlus_v2.4.2_Hard.ips RedPlusPlus_v2.4.2_Hard.gb
RUN ls -l
ENTRYPOINT ["/bin/bash"]
