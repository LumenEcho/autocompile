FROM gcc:trixie

WORKDIR /usr/local/app

COPY ./dockerTemp ./

RUN gcc dockerCode.c -o outFile

RUN chmod 777 outFile

CMD ["./outFile"]