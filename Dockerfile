# Use Go image with all build tools included
FROM golang:1.22

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum first for caching
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the code
COPY . .

# Build the Go binary
RUN go build -o app

# Expose port 8080 (your app should listen here)
EXPOSE 8080

# Run the binary
CMD ["./app"]
