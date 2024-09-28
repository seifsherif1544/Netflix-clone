#! /bin/bash


echo "------------------------- Showing images & Containers -------------------------------"

docker images

docker ps

echo "------------------------- Deleting images & Containers -------------------------------"

docker stop $(docker ps -a -q) 

docker rm $(docker ps -a -q)

docker rmi -f $(docker images -aq)  


echo "------------------------- Showing images & Containers -------------------------------"

docker images

docker ps

echo "--------------------------- Bulding image from Dockerfile -----------------------------"

sh docker build --build-arg TMDB_V3_API_KEY=023344d139572e6c6c41a11b0c7afc57 -t ssherif/netflix .

echo "----------------------------- Create Container from image -----------------------------"

docker run --name netflix-website --rm -d -p 2000:80 ssherif/netflix:latest

echo "------------------------ Push a new tag to this repository-----------------------------"

docker login 

docker push ssherif/netflix:latest

echo "---------------------------------- Showing Web-Site -----------------------------------"

sleep 10s

curl localhost:2000
