FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get update
RUN apt-get install -y build-essential unzip wget gnupg git mercurial meld
RUN apt-get install -y autoconf automake build-essential
RUN apt-get install -y sudo
# Under construction
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
WORKDIR /root
RUN adduser --disabled-password --gecos '' build
USER build
WORKDIR /home/build
# java 
USER root
RUN apt-get install -y java-common locales
RUN yes | geekgit-install-java
USER build
RUN java -version
# android sdk
USER root
ENV AndroidSdkPath "/android_sdk"
ENV SdkVar "sdk-tools-linux-4333796"
RUN mkdir -p "${AndroidSdkPath}"
RUN chown -R build:build "${AndroidSdkPath}"
RUN chmod -R a+rwx "${AndroidSdkPath}"
USER build
WORKDIR "${AndroidSdkPath}"
RUN wget --secure-protocol=TLSv1_2 --https-only "https://dl.google.com/android/repository/${SdkVar}.zip"
RUN unzip -d "${SdkVar}" "${SdkVar}.zip"
WORKDIR "${AndroidSdkPath}/${SdkVar}/tools/bin"
RUN yes | ./sdkmanager --update
RUN yes | ./sdkmanager "platforms;android-28" "build-tools;28.0.3" "extras;google;m2repository" "extras;android;m2repository"
RUN yes | ./sdkmanager "ndk-bundle"
RUN yes | ./sdkmanager --licenses
ENV BinPath "/android_sdk/sdk-tools-linux-4333796/tools/bin"
ENV ToolsPath "/android_sdk/sdk-tools-linux-4333796/tools"
ENV ANDROID_HOME "/android_sdk/sdk-tools-linux-4333796"
RUN echo "Old PATH: ${PATH}"
ENV PATH "${BinPath}:${PATH}"
ENV PATH "${ToolsPath}:${PATH}"
ENV PATH "${ANDROID_HOME}:${PATH}"
RUN echo "New PATH: ${PATH}"
WORKDIR /home/build
RUN sdkmanager --list
ENTRYPOINT ["/bin/bash"]
