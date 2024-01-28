BINARY_NAME := your-app-name
VERSION := 1.0.0
OUT_DIR := out

build:
	go build -o $(BINARY_NAME) ./cmd

build-all:
	GOOS=windows GOARCH=amd64 go build -o $(OUT_DIR)/$(BINARY_NAME)_$(VERSION)_windows_amd64.exe ./cmd
	GOOS=darwin GOARCH=amd64 go build -o $(OUT_DIR)/$(BINARY_NAME)_$(VERSION)_darwin_amd64 ./cmd
	GOOS=darwin GOARCH=arm64 go build -o $(OUT_DIR)/$(BINARY_NAME)_$(VERSION)_darwin_arm64 ./cmd
	GOOS=linux GOARCH=amd64 go build -o $(OUT_DIR)/$(BINARY_NAME)_$(VERSION)_linux_amd64 ./cmd
	GOOS=linux GOARCH=arm64 go build -o $(OUT_DIR)/$(BINARY_NAME)_$(VERSION)_linux_arm64 ./cmd

.PHONY: build build-all
