FROM python:3.8.7

# RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python3 python3-dev git python3-pip python3-setuptools
# RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python-dev git python-pip python-setuptools

RUN pip3 install paho-mqtt
RUN pip3 install broadlink

RUN mkdir -p /app/data
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

# works
# dockebuild . -t broadlink2mqtt
# docker run --rm -it --network my-macvlan-net -p 80:80 -p 443:443 -p 1883:1883 -p 8883:8883 --name broadlink2mqtt -v broadlink_data:/broadlink-mqtt/data broadlink2mqtt


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
#docker build . -t broadlink2mqtt:latest
# docker build -t broadlink2mqtt .
# run the image
# docker run --rm -it --network host -p 80:80 -p 443:443 -p 1883:1883 --name broadlink2mqtt -v broadlink_data:/broadlink2mqtt/data broadlink2mqtt:latest
# docker run --rm -it --network host --name broadlink2mqtt -v broadlink_data:/broadlink2mqtt/data broadlink2mqtt:latest

# while it still exists - commit and push it
#container must be running or stopped(not removed) to push
# docker login
# docker commit -m "pi broadlink2mqtt python3 img" -a "chris b" broadlink2mqtt broadlink2mqtt:latest
# docker commit  broadlink2mqtt chrispab/broadlink2mqtt:latest
# docker push chrispab/broadlink2mqtt:latest