FROM alpine

RUN apk update && apk add --no-cache curl

RUN curl -L https://github.com/portainer/portainer/releases/download/2.18.4/portainer-2.18.4-linux-amd64.tar.gz -o portainer.tar.gz \
    && tar -xvf portainer.tar.gz \
    && mv portainer /usr/local/bin/ \
    && rm portainer.tar.gz

#EXPOSE 9000
EXPOSE 9443
#EXPOSE 8000

CMD ["/usr/local/bin/portainer/portainer"]
