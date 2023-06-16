# Use the official Go image as the base image
FROM golang:1.20.5-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files and download dependencies
COPY go.mod ./
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# Use a lightweight base image for the final container
FROM alpine:3.18.2

# Set the working directory inside the container
WORKDIR /app

# Copy the built executable from the builder stage
COPY --from=builder /app/main .

# Expose the port that the application listens on
EXPOSE 8080

# Set the command to run the executable
CMD ["./main"]