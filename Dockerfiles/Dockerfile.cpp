FROM frolvlad/alpine-gxx:buildcache-linux-amd64

WORKDIR /usr/local/app

COPY ./dockerTemp ./

RUN g++ dockerCode.cpp -o outFile

CMD ["./outFile"]