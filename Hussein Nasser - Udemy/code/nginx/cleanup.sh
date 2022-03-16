docker rm -f $(docker ps -a -q)
docker rmi $(docker images -q)
docker build -t nginx .
docker run --name nginx -p 8080:80 -d nginx