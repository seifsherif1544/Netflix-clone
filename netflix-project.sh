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

sh docker build --build-arg TMDB_V3_API_KEY=your_api_key_here -t ssherif/netflix .


echo "----------------------------- Create Container from image -----------------------------"

docker run --name netflix-website --rm -d -p 2000:2000 ssherif/netflix

echo "---------------------------------- Showing Web-Site -----------------------------------"

sleep 10s

curl localhost:2000
