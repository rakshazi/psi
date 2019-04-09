FROM alpine:latest

COPY ./psi.sh /bin/psi
RUN apk --no-cache add curl jq bash && \
    chmod +x /bin/psi

ENTRYPOINT ["psi"]
