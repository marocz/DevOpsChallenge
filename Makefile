# Write a settings for Makefile for service 1 and 2
.PHONY: build-service1 build-service2 run-service1 run-service2 clean

# Build commands for each service
build-service1:
	cd service1 && cargo build --release

build-service2:
	cd service2 && cargo build --release

# Run commands for each service
run-service1:
	cd service1 && cargo run --release

run-service2:
	cd service2 && cargo run --release

# Build both services
build-all: build-service1 build-service2

# Run both services in parallel (requires the `&` to background the first process)
run-all:
	cd service1 && cargo run --release & cd service2 && cargo run --release

# Clean up build artifacts for both services
clean:
	cd service1 && cargo clean
	cd service2 && cargo clean
