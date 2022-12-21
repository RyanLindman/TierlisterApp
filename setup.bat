@echo off
docker build -t ryan-database .
docker run -d -p3306:3306 ryan-database
echo running on port 3306 - password:root
