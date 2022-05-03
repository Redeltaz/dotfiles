#!/bin/bash

setup_basics () {
    apt update -y
    apt upgrade -y

    apt install -y \
        git \
        curl \
        wget \
        zsh
}
