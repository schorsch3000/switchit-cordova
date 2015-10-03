#!/bin/bash
textReset=$(tput sgr0)
textGreen=$(tput setaf 2)
message_info () {
  echo "${textGreen}[my-app]${textReset} $1"
}

message_info "Creating necessary directories..."
mkdir plugins
mkdir platforms

message_info "Adding platforms..."
cordova platform add android
#phonegap build ios

message_info "Adding plugins..."
