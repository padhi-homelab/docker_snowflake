FROM golang:1.17.3-alpine

WORKDIR /go/src/
RUN export GO111MODULE=on \
 && go install git.torproject.org/pluggable-transports/snowflake.git/proxy@0a2598a1e854243b2f69dae05d713260b4816098

ENTRYPOINT [ "proxy", "--broker", "https://snowflake-broker.torproject.net/", \
                      "--relay" , "wss://snowflake.torproject.net/" ]
