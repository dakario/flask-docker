# Pull code

```
git clone https://github.com/dakario/flask-docker.git
cd flask-docker
```

# Create docker registry

```
docker run -d -p 5000:5000 --restart always --name registry registry:2
```

# 1 Build Docker Image

```
docker build -t flask-demo:latest .
```

# 2 Push Image to docker registry

```
docker tag flask-demo:latest localhost:5000/flask-demo:latest
docker push localhost:5000/flask-demo:latest
```

# 3 Start Flask Container

```
docker run -d -p 80:80 --name flask1 localhost:5000/flask-demo:latest
```

# 4 Change code, rebuild and push image to registry

```
docker build -t flask-demo:latest
docker tag flask-demo:latest localhost:5000/flask-demo:latest
```

# 5 Redeploy 

```
docker rm -f flask1
docker run -d -p 80:80 --name flask1 flask-demo
```

