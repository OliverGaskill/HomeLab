# ===== Build stage =====
FROM golang:1.22 AS builder

# Set working directory inside the container
WORKDIR /app

# Cache dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the code
COPY . .

# Build the Go app as a statically linked binary
RUN CGO_ENABLED=0 GOOS=linux go build -o app

# ===== Final stage =====
FROM alpine:3.19

# Set working directory inside final image
WORKDIR /app

# Copy binary from builder
COPY --from=builder /app/app .

# Expose port (your app should listen on this port)
EXPOSE 8080

# Run the binary
CMD ["./app"]
