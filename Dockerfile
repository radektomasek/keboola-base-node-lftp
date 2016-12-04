# VERSION 1.0.0
FROM radektomasek/keboola-base-node
MAINTAINER Radek Tomasek <radek.tomasek@gmail.com>

WORKDIR /tmp

# Install dependencies required for building lftp.
RUN yum install -y tar gcc gcc-c++ ncurses-devel readline-devel gnutls-devel || true
# Configure lftp environment.
RUN curl -O http://lftp.yar.ru/ftp/lftp-4.7.2.tar.gz && tar xzvf lftp-4.7.2.tar.gz && cd lftp-4.7.2 && ./configure --with-gnutls --without-openssl --prefix=${HOME}/local && make && make install && mkdir ~/.lftp/ && echo "set ftp:ssl-force true;set ftp:ssl-protect-data true;set ftp:ssl-allow true;set ssl:verify-certificate no;" >> ~/.lftp/rc && ln -s ~/local/bin/lftp /usr/bin/lftp
