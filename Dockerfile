FROM golang:1.17.0-alpine

WORKDIR /go/src/
RUN export GO111MODULE=on \
 && go install git.torproject.org/pluggable-transports/snowflake.git/proxy@v1.1.0

ENTRYPOINT [ "proxy", "--broker", "https://snowflake-broker.torproject.net/", \
                      "--relay" , "wss://snowflake.torproject.net/" ]
