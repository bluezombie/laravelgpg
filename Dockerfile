FROM docker.io/bitnami/laravel:8
LABEL maintainer "German Otero <unleashed.gotero@gmail.com>"

# Change user for packages installation

USER 0

RUN apt-get update
RUN apt-get install -y gcc make autoconf libc-dev pkg-config
RUN apt-get install -y libgpgme11-dev
RUN pecl install gnupg
RUN bash -c "echo extension=gnupg.so >> /opt/bitnami/php/conf/php.ini"

# A few extra bucks for the encrypting/decrypting process
RUN sed -e "s?memory_limit = 128M?memory_limit = 512M?" /opt/bitnami/php/conf/php.ini

USER 1000