# Builder 
FROM golang:1.21.13-alpine3.20 AS builder

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o transactionapi .

# Production ready Deployment
FROM alpine:3.20

COPY --from=builder /app/transactionapi .
COPY --from=builder /app/config config/
COPY --from=builder /app/db/migrations db/migrations


CMD [ "sh", "-c", "./transactionapi" ]