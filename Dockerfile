FROM golang:1.16.7-alpine

WORKDIR /go/src/
RUN export GO111MODULE=on \
 && go install git.torproject.org/pluggable-transports/snowflake.git/proxy@v1.0.0

ENTRYPOINT [ "proxy", "--broker", "https://snowflake-broker.torproject.net/", \
                      "--relay" , "wss://snowflake.torproject.net/" ]
