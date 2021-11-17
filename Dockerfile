FROM ubuntu
LABEL Author="Jean-François Auger <nechry@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

RUN apt-get install -y \
        build-essential \
        pkg-config \
        libudev-dev \
        git


RUN mkdir /home/blinkdev

ENV HOME /home/blinkdev

RUN git clone https://github.com/todbot/blink1-tool.git ${HOME}/commandline

WORKDIR ${HOME}/commandline

RUN make OS=linux all blink1-tiny-server && make install && cp blink1-tiny-server /usr/local/bin/

EXPOSE 8080

ENTRYPOINT ["blink1-tiny-server",  "-p", "8080"]