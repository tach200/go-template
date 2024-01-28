FROM alpine AS builder
RUN apk add --no-cache ca-certificates

FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
# Change path to which binary you need
ADD out/linux/your-app-name_linux_amd64 /your-app-name

ENTRYPOINT ["/your-app-name"]