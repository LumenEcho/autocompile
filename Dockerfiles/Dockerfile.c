FROM frolvlad/alpine-gcc:buildcache-linux-arm64

WORKDIR /usr/local/app

COPY ./dockerTemp ./

RUN gcc dockerCode.c -o outFile

CMD ["./outFile"]