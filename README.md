# docker-apache2

# Build
```
docker build -t apache2 .
```
# Usage
```
docker run -d -p 80:80 --name web01 apache2
```
# Test
	http://hostname or ip/

# Attach persistent/shared directories
```
docker run -d -p 80:80 -v <html-dir>:/var/www/html --web01 apache2 apache2
```