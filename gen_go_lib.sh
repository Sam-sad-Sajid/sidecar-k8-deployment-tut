#!/bin/bash
set -eu

# server
protoc --go_out=. --go_opt=paths=source_relative \
    --go-grpc_out=. --go-grpc_opt=paths=source_relative \
grpc-server/proto/service.proto

cd grpc-server
go mod download
go mod tidy
cd ..

# client
protoc --go_out=. --go_opt=paths=source_relative \
           --go-grpc_out=. --go-grpc_opt=paths=source_relative \
grpc-client/proto/service.proto

cd grpc-server
go mod download
go mod tidy
cd ..