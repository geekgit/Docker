FROM fedora:22
MAINTAINER geekgit
RUN dnf install -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf update -y
RUN dnf install -y @development-tools
#Build deps
RUN dnf install --best --allowerasing -y alsa-lib-devel.i686 alsa-lib-devel.x86_64 alsa-plugins-pulseaudio.i686 atk-devel.i686 bzip2-devel.i686 bzip2-devel.x86_64 Cg cmake cmake freeglut-devel.i686 freeglut-devel.x86_64 freeglut.i686 freeglut.x86_64 freetype-devel.i686 freetype-devel.x86_64 gcc gcc-c++ gcc-c++.i686 gdk-pixbuf2-devel.i686 git glew-devel.i686 glew-devel.x86_64 glew.x86_64 glib2-devel.i686 glibc-devel.i686 glibc-devel.x86_64 gtk2-devel.i686 gtk2-devel.x86_64 ilmbase.x86_64 ImageMagick.x86_64 lesstif-devel.x86_64 lesstif.x86_64 libaio libaio-devel libaio-devel.i686 libaio.i686 libCg.i686 libCg.x86_64 libGLEW.i686 libGLEW.x86_64 libICE-devel.i686 libjpeg-turbo-devel.i686 libjpeg-turbo-devel.x86_64 libjpeg-turbo.i686 libjpeg-turbo-utils.x86_64 libjpeg-turbo.x86_64 libpng-devel libpng-devel.i686 libSM-devel.i686 libwmf-lite.x86_64 libX11-devel.i686 libXext-devel.i686 libXp-devel.x86_64 libXp.x86_64 lzma-devel.i686 lzma-devel.x86_64 lzma-libs.i686 lzma-libs.x86_64 lzma-sdk-devel.i686 lzma-sdk-devel.x86_64 lzma-sdk.i686 lzma-sdk.x86_64 mesa-libEGL-devel.i686 mesa-libEGL.i686 mesa-libGL-devel.i686 mesa-libGLU-devel.i686 mesa-libGLw-devel.x86_64 mesa-libGLw.x86_64 mesa-libOSMesa-devel.x86_64 mesa-libOSMesa.x86_64 mock OpenEXR-libs.x86_64 perl-parent perl-podlators perl-Pod-Parser perl-Pod-Perldoc perl-Pod-Usage plague-client plague-common portaudio-devel.i686 portaudio-devel.x86_64 portaudio.i686 portaudio.x86_64 python-deltarpm.x86_64 python-magic rpm-apidocs rpm-build.x86_64 rpm-compare-req rpmconf rpm-cron rpmdepsize.x86_64 rpm-devel.x86_64 rpmdevtools rpmlint rpmorphan rpmreaper.x86_64 rpmrebuild rpm-sign.x86_64 SDL-devel.i686 SDL-devel.x86_64 SDL.i686 sparsehash-devel.i686 sparsehash-devel.x86_64 svn turbojpeg-devel.i686 wxGlade wxGTK-devel.i686 wxGTK-devel.x86_64 wxPython.x86_64 xemacs-filesystem xorg-x11-xtrans-devel zlib-devel.i686 zlib-devel.x86_64
#User for build
RUN useradd build
USER build
WORKDIR /home/build
#try~
## using zip
## ADD pcsx2-master.zip /home/build/pcsx2-master.zip
## RUN unzip pcsx2-master.zip
## using git
## RUN git clone https://github.com/PCSX2/pcsx2
RUN git clone https://github.com/PCSX2/pcsx2
WORKDIR /home/build/pcsx2
RUN ./build.sh --dev --extra --clean
ENTRYPOINT ["/bin/bash"]

