# Minimal Dockerfile for local builds
FROM golang:1.24.8

WORKDIR /app
COPY . .

# Build the Go binary
RUN go build -o app

EXPOSE 8080
CMD ["./app"]
