FROM alpine:3.22.4

WORKDIR /usr/local/app

COPY ./dockerTemp ./

RUN chmod 777 dockerCode.sh

CMD ["./dockerCode.sh"]