# Build Docker Image

git clone https://github.com/aliouba/flask-docker.git

cd flask-docker

docker build -t flask-demo:latest .

# Create docker registry

docker run -d -p 5000:5000 --restart always --name registry registry:2

# Push Image to docker registry

docker tag flask-demo:latest localhost:5000/flask-demo:latest

docker push localhost:5000/flask-demo:latest

# Start Flask Container

docker run -d -p 80:80 --name flask1 localhost:5000/flask-demo:latest

# Rebuild

docker build -t flask-demo:latest

docker tag flask-demo:latest localhost:5000/flask-demo:latest

docker rm -f flask1

docker run -d -p 80:80 --name flask1 flask-demo

