# FROM python:latest
FROM debian:buster
 RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python3 python3-dev git python3-pip python3-setuptools
# RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python-dev git python-pip python-setuptools

# RUN apt-get install build-essential libssl-dev libffi-dev python3-dev cargo
# RUN python3 -m pip install 
#--no-use-pep517 cryptography
#  RUN pip install --upgrade pip
# RUN pip3 install --upgrade pip setuptools wheel
RUN pip install --upgrade pip
RUN pip install paho-mqtt
RUN pip install cryptography

RUN pip3 install broadlink
#==0.15.0

RUN mkdir -p /app/data
# ID=$(id -u)
WORKDIR /app

COPY . .
RUN ls
RUN cd data && ls

# WORKDIR /app
RUN echo 'we are running '
# CMD ["python3", "mqtt.py"]
CMD ["python3", "mqtt.py"]
# ENTRYPOINT [ "python3" ]

# CMD [ "mqtt.py" ]
# docker build . -t broadlink2mqtt
# docker run -it --name broadlink2mqtt -v data:/broadlink-mqtt/data broadlink2mqtt
#docker run --rm -it -p 80:80 -p 443:443 -p 1883:1883 --name broadlink2mqtt -v broadlink_data:/broadlink2mqtt/data broadlink2mqtt:latest
#docker run --rm -it --name broadlink2mqtt -v broadlink_data:/broadlink2mqtt/data broadlink2mqtt:latest

#docker run --rm -it --network my-macvlan-net -p 80:80 -p 443:443 -p 1883:1883 -p 8883:8883 --name broadlink2mqtt -v broadlink_data:/broadlink-mqtt/data broadlink2mqtt
#docker run --rm -it --network my-macvlan-net -p 80:80 -p 443:443 -p 1883:1883 -p 8883:8883 --name broadlink2mqtt -v data:/broadlink-mqtt/data broadlink2mqtt



# docker login
# docker commit -m "1st broadlink2mqtt img" -a "chris b" broadlink2mqtt chrispab/broadlink2mqtt:pi
# docker push chrispab/broadlink2mqtt
# 

# dockebuild . -t broadlink2mqtt
# docker run --rm -it --network host -p 80:80 -p 443:443 -p 1883:1883 -p 8883:8883 --name broadlink2mqtt -v broadlink2mqtt:/broadlink2mqtt/data broadlink2mqtt


# docker run --rm -it --network host  --name broadlink2mqtt -v broadlink2mqtt:/broadlink2mqtt/data broadlink2mqtt:latest

#container must be running or stopped(not removed) to push
# docker login
# docker commit -m "pi broadlink2mqtt python3 img" -a "chris b" broadlink2mqtt broadlink2mqtt:latest
# docker push chrispab/broadlink2mqtt:latest

#docker build . -t broadlink2mqtt:latest


# docker network create -d macvlan --subnet=192.168.0.0/24  --gateway=192.168.0.1  -o parent=eno1   my-macvlan-net



# docker run --rm -dit   --network my-macvlan-net   --name my-macvlan-alpine   alpine:latest  ash

# docker run --rm -it --network my-macvlan-net -p 80:80 -p 443:443 -p 1883:1883 -p 8883:8883 --name broadlink2mqtt -v data:/broadlink-mqtt/data broadlink2mqtt
#############################
####these
# build the image
# docker build -t broadlink2mqtt:latest .
# or
# docker build -t broadlink2mqtt .
# run the image
# docker run --rm -it --network host --name broadlink2mqtt -v ~/IOTstack/volumes/broadlink2mqtt/data:/app/data  broadlink2mqtt:latest

# while it still exists - commit and push it
#container must be running or stopped(not removed) to push
# docker login
# ------docker commit -m "pi broadlink2mqtt python3 img" -a "chris b" broadlink2mqtt broadlink2mqtt:latest
# docker commit  broadlink2mqtt chrispab/broadlink2mqtt:latest
# docker push chrispab/broadlink2mqtt:latest

# when running in IOtstack:
# creat the host f volfolder and custom.conf file before it can be docler compose up --~/IOTstack/volumes/broadlink2mqtt/data
# ensure vol; folder mapping is in the docker compose file - -v ~/IOTstack/volumes/broadlink2mqtt/data:/app/data

# docker run --rm -it --network host --name broadlink2mqtttest1 -v ~/IOTstack/volumes/bltest1/data:/app/data  broadlink2mqtt:test1