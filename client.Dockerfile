FROM golang:1.11 as builder
MAINTAINER Venil Noronha <veniln@vmware.com>

WORKDIR /root/go/src/github.com/vnoronha/grpc-web-demo/
COPY ./ .
RUN CGO_ENABLED=0 GOOS=linux GO111MODULE=on \
    go build -a -installsuffix cgo -v -o bin/client ./cmd/client.go

FROM photon:2.0
WORKDIR /bin/
COPY --from=builder /root/go/src/github.com/vnoronha/grpc-web-demo/bin/client .
CMD [ "/bin/sh" ]
