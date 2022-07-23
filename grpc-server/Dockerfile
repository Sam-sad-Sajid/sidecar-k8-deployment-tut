FROM golang:1.18-alpine

WORKDIR /app

COPY . .

# Fetch dependencies
RUN go mod download
RUN go mod tidy

# Build the binary. for grpc gateway
RUN go build -o /grpc-server

EXPOSE 50051

CMD [ "/grpc-server" ]
