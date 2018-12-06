FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get update
RUN apt-get install -y build-essential unzip wget gnupg git mercurial meld
RUN apt-get install -y autoconf automake build-essential
RUN apt-get install -y sudo
RUN apt-get install -y cmake golang-go
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
# ninja
USER root
WORKDIR /
ENV ninja "/ninja"
RUN mkdir -p "${ninja}"
RUN chown -R build:build "${ninja}"
RUN chmod -R a+rwx "${ninja}"
WORKDIR "${ninja}"
ENV NinjaVer 1.8.2
USER build
RUN wget --secure-protocol=TLSv1_2 --https-only "https://github.com/ninja-build/ninja/releases/download/v${NinjaVer}/ninja-linux.zip" -O "ninja-linux-v${NinjaVer}.zip"
RUN unzip -d "v${NinjaVer}" "ninja-linux-v${NinjaVer}.zip"
ENV NINJA_PATH_ROOT /ninja/v1.8.2
ENV NINJA_PATH /ninja/v1.8.2/ninja
ENV PATH "${NINJA_PATH_ROOT}:${PATH}"
USER build
WORKDIR /home/build
RUN git clone --recursive https://github.com/Telegram-FOSS-Team/Telegram-FOSS
WORKDIR /home/build/Telegram-FOSS/TMessagesProj/jni
RUN ./build_ffmpeg_clang.sh
RUN ./patch_boringssl.sh
RUN ./build_boringssl.sh
WORKDIR /home/build/Telegram-FOSS
RUN echo "APP_ID = 12345" > API_KEYS
RUN echo "APP_HASH = aaaaaaaabbbbbbccccccfffffff001122" >> API_KEYS
RUN ./gradlew assembleAfatRelease
# result: /home/build/Telegram-FOSS/TMessagesProj/build/outputs/apk/afat/release/TMessagesProj-afat-release-unsigned.apk
RUN cp /home/build/Telegram-FOSS/TMessagesProj/build/outputs/apk/afat/release/TMessagesProj-afat-release-unsigned.apk /home/build/Telegram.apk
USER root
RUN chmod a+rwx /home/build/Telegram.apk
RUN chown build:build /home/build/Telegram.apk
USER build
WORKDIR /home/build
ENTRYPOINT ["/bin/bash"]
