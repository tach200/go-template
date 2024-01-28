BINARY_NAME := your-app-name

build:
	go build -o $(BINARY_NAME) ./cmd

.PHONY: build build-all
build-all:
	GOOS=windows GOARCH=amd64 go build -o out/windows/$(BINARY_NAME)_windows_amd64.exe ./cmd
	GOOS=darwin GOARCH=amd64 go build -o out/darwin/$(BINARY_NAME)_darwin_amd64 ./cmd
	GOOS=darwin GOARCH=arm64 go build -o out/darwin/$(BINARY_NAME)_darwin_arm64 ./cmd
	GOOS=linux GOARCH=amd64 go build -o out/linux/$(BINARY_NAME)_linux_amd64 ./cmd
	GOOS=linux GOARCH=arm64 go build -o out/linux/$(BINARY_NAME)_linux_arm64 ./cmd

.PHONY: test
test:
	go test ./...

.PHONY: docker-build
docker-build:
	docker build -t $(BINARY_NAME) .