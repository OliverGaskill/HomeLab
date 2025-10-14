# Build stage
FROM golang:1.22 AS builder
WORKDIR /app

# Cache dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy code and build
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# Final image
FROM alpine:3.19
WORKDIR /app
COPY --from=builder /app/main .
EXPOSE 8080
CMD ["./main"]
