ARG GO_VERSION
ARG ALPINE_VERSION

FROM --platform=${BUILDPLATFORM} golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS builder
RUN apk add --no-cache git make
ARG GO_NETADDRS_VERSION="main"
ADD https://github.com/hashicorp/go-netaddrs.git#${GO_NETADDRS_VERSION} /tmp/source
RUN --mount=type=cache,target=/go/pkg/mod \
    <<EOT
    set -ex
    cd /tmp/source/cmd/netaddrs
    export CGO_ENABLED=0
    export GOOS=linux
    for GOARCH in amd64 arm64; do
        export GOARCH
        go build -o /netaddrs-$GOOS-$GOARCH
    done
EOT

FROM scratch
ARG TARGETOS
ARG TARGETARCH
COPY --from=builder /netaddrs-$TARGETOS-$TARGETARCH /netaddrs
