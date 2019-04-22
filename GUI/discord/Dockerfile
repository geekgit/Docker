FROM ubuntu:18.04
MAINTAINER geekgit
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install -y adwaita-icon-theme at-spi2-core dconf-gsettings-backend dconf-service fontconfig fontconfig-config fonts-dejavu-core gconf-service gconf-service-backend gconf2-common glib-networking glib-networking-common glib-networking-services gsettings-desktop-schemas gtk-update-icon-cache hicolor-icon-theme humanity-icon-theme libappindicator1 libasound2 libasound2-data libatk-bridge2.0-0 libatk1.0-0 libatk1.0-data libatspi2.0-0 libavahi-client3 libavahi-common-data libavahi-common3 libc++1 libc++abi1 libcairo-gobject2 libcairo2 libcolord2 libcroco3 libcups2 libdatrie1 libdbus-glib-1-2 libdbusmenu-glib4 libdbusmenu-gtk4 libdconf1 libepoxy0 libfontconfig1 libfreetype6 libgail-common libgail18 libgconf-2-4 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgraphite2-3 libgtk-3-0 libgtk-3-bin libgtk-3-common libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libharfbuzz0b libindicator7 libjbig0 libjpeg-turbo8 libjpeg8 libjson-glib-1.0-0 libjson-glib-1.0-common liblcms2-2 libnotify4 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpixman-1-0 libpng16-16 libproxy1v5 librest-0.7-0 librsvg2-2 librsvg2-common libsoup-gnome2.4-1 libsoup2.4-1 libthai-data libthai0 libtiff5 libwayland-client0 libwayland-cursor0 libwayland-egl1 libxcb-render0 libxcb-shm0 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxi6 libxinerama1 libxkbcommon0 libxrandr2 libxrender1 libxss1 libxtst6 notification-daemon ubuntu-mono x11-common xkb-data build-essential sudo unzip wget git
RUN apt-get install -y mesa-utils libx11-xcb1
# geekgit linux_scripts_meta install
WORKDIR /root
RUN git clone https://github.com/geekgit/linux_scripts_meta
WORKDIR /root/linux_scripts_meta
RUN ./download-container.sh
RUN adduser --disabled-password --gecos '' user
USER user
WORKDIR /home/user
RUN wget --secure-protocol=TLSv1_2 --https-only "https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb" -O "discord.deb"
USER root
RUN dpkg -i discord.deb
USER user
ENTRYPOINT ["/bin/bash"]
