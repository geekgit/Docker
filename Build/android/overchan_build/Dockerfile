FROM ubuntu:18.04
MAINTAINER geekgit
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get update
RUN apt-get install -y build-essential unzip wget gnupg git mercurial meld
RUN apt-get install -y autoconf automake build-essential
RUN apt-get install -y sudo
RUN apt-get install -y cmake golang-go
RUN apt-get install -y libncurses5:i386 libstdc++6:i386 zlib1g:i386 ant gradle
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
# old android ndk, version 16
USER root
WORKDIR /
ENV NDK16 "/android_ndk_16"
RUN mkdir -p "${NDK16}"
RUN chown -R build:build "${NDK16}"
RUN chmod -R a+rwx "${NDK16}"
USER build
WORKDIR "${NDK16}"
RUN wget --secure-protocol=TLSv1_2 --https-only "https://dl.google.com/android/repository/android-ndk-r16b-linux-x86_64.zip"
RUN unzip -d "NDK16" android-ndk-r16b-linux-x86_64.zip
ENV NDK16_root "/android_ndk_16/NDK16/android-ndk-r16b"
ENV NDK "${NDK16_root}"
RUN rm -rf "${ANDROID_HOME}/ndk-bundle"
RUN cp -R "${NDK16_root}" "${ANDROID_HOME}/ndk-bundle"
ENV ANDROID_NDK_HOME "${ANDROID_HOME}/ndk-bundle"
USER root
#gradle
RUN mkdir -p "/gradle/2.2"
WORKDIR "/gradle/2.2"
RUN chmod -R a+rwx "/gradle"
RUN chown -R build:build "/gradle"
USER build
RUN wget --secure-protocol=TLSv1_2 --https-only "https://downloads.gradle.org/distributions/gradle-2.2.1-all.zip"
RUN unzip -d "gradle" gradle-2.2.1-all.zip
WORKDIR /home/build
RUN git clone https://github.com/geekgit/Overchan-Android
WORKDIR /home/build/Overchan-Android
RUN yes | sdkmanager "platforms;android-23" "build-tools;23.0.2"
USER root
ADD build.gradle build.gradle
RUN chmod a+rwx build.gradle
RUN chown build:build build.gradle
USER build
RUN /gradle/2.2/gradle/gradle-2.2.1/bin/gradle build
ENTRYPOINT ["/bin/bash"]
