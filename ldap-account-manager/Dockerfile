################
# https://www.ldap-account-manager.org/static/doc/manual-onePage/index.html
# docker build -t trydofor/ldap-account-manager:6.3 .
################

FROM ubuntu:16.04
MAINTAINER trydofor

# Configure apt
RUN DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends \
      fontconfig-config \
      fonts-dejavu \
      fonts-dejavu-core \
      fonts-dejavu-extra \
      ghostscript \
      gsfonts \
      imagemagick-common \
      libavahi-client3 \
      libavahi-common-data \
      libavahi-common3 \
      libcups2 \
      libcupsfilters1 \
      libcupsimage2 \
      libcurl3 \
      libfftw3-double3 \
      libfontconfig1 \
      libgd3 \
      libgomp1 \
      libgs9 \
      libgs9-common \
      libijs-0.35 \
      libjbig0 \
      libjbig2dec0 \
      libjpeg-turbo8 \
      libjpeg8 \
      liblcms2-2 \
      liblqr-1-0 \
      libltdl7 \
      libmagickcore-6.q16-2 \
      libmagickwand-6.q16-2 \
      libpaper-utils \
      libpaper1 \
      libtiff5 \
      libvpx3 \
      libxpm4 \
      libxslt1.1 \
      libzip4 \
      php \
      php-curl \
      php-gd \
      php-imagick \
      php-ldap \
      php-xml \
      php-zip \
      php7.0-curl \
      php7.0-gd \
      php7.0-ldap \
      php7.0-xml \
      php7.0-zip \
      poppler-data \
      ttf-dejavu-core \
      apache2 \
      libapache2-mod-php7.0 \
      wget

RUN wget --no-check-certificate \
      https://github.com/LDAPAccountManager/lam/releases/download/lam_6_3/ldap-account-manager_6.3-1_all.deb \
      -O    /tmp/ldap-account-manager_all.deb \
 && dpkg -i /tmp/ldap-account-manager_all.deb \
 && rm -rf  /tmp/ldap-account-manager_all.deb

RUN apt-get purge wget ca-certificates -y  \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./start.sh /usr/local/bin/start-lam.sh
RUN chmod +x /usr/local/bin/start-lam.sh

RUN a2enmod php7.0 \
 && rm -rf /var/lib/ldap-account-manager/config/config.cfg \
 && cp /etc/ldap-account-manager/config.cfg /var/lib/ldap-account-manager/config/config.cfg \
 && mv /var/lib/ldap-account-manager/config /var/lib/ldap-account-manager/config.back \
 && mv /var/lib/ldap-account-manager/sess   /var/lib/ldap-account-manager/sess.back

VOLUME /config 
EXPOSE 80

CMD ["start-lam.sh"]
