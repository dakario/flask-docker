FROM ubuntu:latest
LABEL maintainer="Aliou BA" email="aliou.ba@beopenit.com"
RUN apt-get update -y
RUN apt-get install -y python3 python3-pip python3-dev build-essential
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
ENTRYPOINT ["flask"]
CMD ["--app", "app","run","--host=0.0.0.0", "--port=80"]
