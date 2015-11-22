#!/bin/bash

docker build -t docker-demo/php .

docker run -p 8080:80 -d docker-demo/php


