FROM golang:1.17.6-alpine


ARG SNOWFLAKE_VERSION=2.0.1


WORKDIR /go/src/

RUN apk add --no-cache --update git \
 && git clone https://git.torproject.org/pluggable-transports/snowflake.git \
 && cd snowflake \
 && git checkout v${SNOWFLAKE_VERSION} \
 && export GO111MODULE=on \
 && go install ./proxy


ENTRYPOINT [ "proxy", "--broker", "https://snowflake-broker.torproject.net/", \
                      "--relay" , "wss://snowflake.torproject.net/" ]
