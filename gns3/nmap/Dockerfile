FROM ubuntu:16.04
RUN apt-get update && apt-get install -y nmap
RUN apt-get install -y htop
CMD htop
RUN mkdir /test
RUN echo "hello" > /test/world
VOLUME /test
WORKDIR /test
