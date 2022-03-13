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


docker run \
-e "ACCEPT_EULA=Y" \
-e "SA_PASSWORD=Abc@123456789" \
--name sql-server-2019-container \
-p 1435:1433 \
-v /Users/hoangnd/Desktop/temp:/var/opt/mssql \
-d mcr.microsoft.com/mssql/server:2019-CU15-ubuntu-20.04

Docker container with default volume
docker run \
-e "ACCEPT_EULA=Y" \
-e "SA_PASSWORD=Abc@123456789" \
--name sql-server-2019-container \
-p 1435:1433 \
-v my-volume-1:/var/opt/mssql \
-d mcr.microsoft.com/mssql/server:2019-CU15-ubuntu-20.04

Volume's path in Host(your PC, laptop):
ls -la ~/Library/Containers/com.docker.docker/Data/vm


remove container => data lost => how to solve ?
Let's map container's volume to your host(PC)'s volume
docker rm 
-f: force
-v "host' volume":"container's volume" 
