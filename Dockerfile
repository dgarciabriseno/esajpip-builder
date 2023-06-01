FROM oraclelinux:8
WORKDIR /root

RUN dnf config-manager -y --set-enabled ol8_codeready_builder && \
    dnf install -y git cmake gcc-c++ libgsf-devel rpmdevtools && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h &&        \
    rpmdev-setuptree && \
    git clone https://github.com/Helioviewer-Project/esajpip-SWHV.git esajpip-1.0.0

COPY build.sh .
COPY esajpip /root/esajpip
COPY esajpip.spec /root/rpmbuild/SPECS

ENTRYPOINT ["./build.sh"]