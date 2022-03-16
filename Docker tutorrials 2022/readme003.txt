- Create a python Flask WebApp
- Build an image from this App
- Create container from this image and run

Install python => many ways
which python modules you've installed:
pip3 freeze
run app:
python3 -m flask run

Now we build my own image from the App
docker build --tag python-flask-app .
Name your version:
docker tag python-flask-app:latest python-flask-app:v1.0.0

How to push image to your Docker Hub ?
-Login, create a repository(public/private)
docker tag python-flask-app:v1.0.0 sunlight4d/python-flask-app:v1.0.0

docker push sunlight4d/python-flask-app:v1.0.0

Remove images, pull again, then create container
#-v "$(pwd):/app" => Map this host's current folder to /app(container)

docker run -dp 5002:5000 \
--name python-flask-app-container \
-v "$(pwd):/app" \
sunlight4d/python-flask-app:v1.0.0

docker logs python-flask-app-container

stop/start container:
docker stop python-flask-app-container
docker start python-flask-app-container

Test:
curl localhost:5002

Update python code, add mysql container, add network, volume
docker volume create mysql-python-app-volume
docker volume create mysql-python-app-volume-config

docker network create mysql-python-app-network

Start mysql container:

docker run --rm -d \
-v mysql:/var/lib/mysql \
--name mysql-flask-app-container \
-v mysql-python-app-volume-config:/etc/mysql 
-p 3309:3306 \
--network mysql-python-app-network \  
-e MYSQL_ROOT_PASSWORD=Abc@123456789 \
mysql:8.0.28