docker rm processdocument01 -f
docker rm imageresize01 -f
docker rm website01 -f

docker network create themonolith

docker build -f ..\dockerFiles\Dockerfile_WebService-01-Like -t website-01:v1 ..\containerContext
docker build -f ..\dockerFiles\Dockerfile_Apps-Service-01-ImageResize -t apps-service-01-imageresize:v1 ..\containerContext
docker build -f ..\dockerFiles\Dockerfile_Apps-Service-02-ProcessDocument -t apps-service-02-processdocument:v1 ..\containerContext

docker run -d -p 80:80 --network themonolith --name website01 website-01:v1
docker run -d -p 81:80 --network themonolith --name imageresize01 apps-service-01-imageresize:v1
docker run -d -p 82:80 --network themonolith --name processdocument01 apps-service-02-processdocument:v1

