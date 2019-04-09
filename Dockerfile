FROM alpine:latest

COPY psi.sh /bin/psi
RUN apk --no-cache add curl jq && \
    chmod +x /bin/psi

ENTRYPOINT ["/bin/psi"]
