FROM ubuntu:trusty-20191217
RUN apt-get update -y && apt-get clean -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl \
    build-essential asciidoc binutils bzip2 gawk gettext git \
    libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 \
    libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib \
    p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils \
    upx libelf-dev autoconf automake libtool autopoint device-tree-compiler \
    && apt-get clean -y
RUN useradd -m lede && echo "lede ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
USER lede
RUN git clone https://github.com/coolsnowwolf/lede /home/lede/lede
WORKDIR /home/lede/lede
RUN ./scripts/feeds update -a
RUN ./scripts/feeds install -a
