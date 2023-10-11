#!/bin/bash

container_name=local_nginx

result=$( sudo docker images -q nginx )

if [[ -n "$result" ]]; then
echo "image exists"
sudo docker container rm -f $container_name
sudo docker rmi -f result
else
echo "No such image"
fi

echo "build the docker image"
sudo docker build -t nginx:latest .
sudo docker images -q nginx

echo "built docker images and proceeding to delete existing container"
result1=$( sudo docker images -q nginx )

if [[ $? -eq 0 ]]; then
echo "Container exists"
sudo docker container rm -f $container_name
echo "Deleted the existing docker container"
else
echo "No such container"
fi

echo "Deploying the updated container"
sudo docker run -d --name local_nginx -p 8082:80 $result1
echo "Deploying the container"