# Minimal Dockerfile for local builds
FROM golang:1.22

WORKDIR /app
COPY . .

# Build the Go binary
RUN go build -o app

EXPOSE 8080
CMD ["./app"]
