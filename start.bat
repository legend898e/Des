@echo off
REM Build the Docker image
docker build -t pufferpanel-custom .

REM Stop and remove existing container if exists
docker rm -f pufferpanel-instance >nul 2>&1

REM Run the container, map port 8080
docker run -d -p 8080:8080 --name pufferpanel-instance pufferpanel-custom

echo PufferPanel started.
echo Open http://localhost:8080 in your browser.
pause
