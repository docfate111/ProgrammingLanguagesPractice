#!/bin/bash
docker build . -t arm
docker run -it arm:latest
