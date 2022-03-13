Pull 2 images 
docker pull mcr.microsoft.com/mssql/server:2019-CU15-ubuntu-20.04
docker pull mcr.microsoft.com/mssql/server:2017-CU28-ubuntu-16.04
tag = version
Create containers from images
1 image => multiple containers
-d : Detach(background) mode
-e: environment variables
--name : container's name
-p: map port

MacOS/Linux:
docker run \
-e "ACCEPT_EULA=Y" \
-e "SA_PASSWORD=Abc@123456789" \
--name sql-server-2019-container \
-p 1435:1433 \
-v /Users/hoangnd/Desktop/temp:/var/opt/mssql \
-d mcr.microsoft.com/mssql/server:2019-CU15-ubuntu-20.04

Docker container with default volume
MacOS/Linux:
docker run \
-e "ACCEPT_EULA=Y" \
-e "SA_PASSWORD=Abc@123456789" \
--name sql-server-2019-container \
-p 1435:1433 \
-v my-volume-1:/var/opt/mssql \
-d mcr.microsoft.com/mssql/server:2019-CU15-ubuntu-20.04

Windows:
docker run ^
-e "ACCEPT_EULA=Y" ^
-e "SA_PASSWORD=Abc@123456789" ^
--name sql-server-2019-container ^
-p 1435:1433 ^
-v my-volume-1:/var/opt/mssql ^
-d mcr.microsoft.com/mssql/server:2019-CU15-ubuntu-20.04

Volume's path in Host(your PC, laptop):
ls -la ~/Library/Containers/com.docker.docker/Data/vms

In Windows:
\\wsl$\docker-desktop-data\version-pack-data\community\docker\volumes

remove container => data lost => how to solve ?
Let's map container's volume to your host(PC)'s volume
docker rm 
-f: force
-v "host' volume":"container's volume" 

Create a container for mysql:
Windows:
docker run ^
-e MYSQL_ROOT_PASSWORD=Abc@123456789 ^
--name mysql8-container ^
-p 3308:3306 ^
-v mysql8-volume:/var/lib/mysql ^
-d mysql

MacOS(Linux):
docker run \
-e MYSQL_ROOT_PASSWORD=Abc@123456789 \
--name mysql8-container \
-p 3308:3306 \
-v mysql8-volume:/var/lib/mysql \
-d mysql

Go inside the container:
-it = interactive mode
docker exec -it mysql8-container bash
Then:
mysql -u root -p

App with multiple containers:
docker run -d \
--network todo-app-network \
--network-alias todo-app-network-alias \
-v todo-mysql-database:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=Abc@123456789 \
-e MYSQL_DATABASE=todoDB \
--name mysql-container \
-d mysql

docker exec -it mysql-container mysql -u root -p

Create another container, has the same network
docker run -it \
--network todo-app-network \
--name netshoot-container \
nicolaka/netshoot

dig = DNS lookup utility
dig todo-app-network-alias

Create another nodeJS container:
-w: working directory

docker run -dp 3002:3000 \
--name todo-app-container \
-w /app -v "$(pwd):/app" \
--network todo-app-network \
-e MYSQL_HOST=todo-app-network-alias \
-e MYSQL_USER=root \
-e MYSQL_PASSWORD= Abc@123456789 \
-e MYSQL_DB=todoDB \
node \
sh -c "yarn install && yarn run dev"

docker logs todo-app-container

open web browser and insert some todolist
docker exec -it mysql-container mysql -u root -p
you can see table with data

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Abc@123456789';
FLUSH PRIVILEGES;
