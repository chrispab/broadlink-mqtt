
# FROM debian:buster
FROM python:3

# RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python3 python3-dev git python3-pip python3-setuptools
# RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python-dev git python-pip python-setuptools

# RUN git clone https://github.com/chrispab/broadlink-mqtt.git
RUN mkdir -p /broadlink-mqtt
COPY . /broadlink-mqtt

WORKDIR /broadlink-mqtt

# RUN pip3 install -r requirements.txt

# RUN apt-get install python-pip3 python3-dev
# RUN apt-get install libffi-dev libssl-dev
RUN pip3 install -r requirements.txt

# ENTRYPOINT [ "python3" ]

# CMD [ "mqtt.py" ]
EXPOSE 80
EXPOSE 1883
EXPOSE 443

# CMD ["python3", "mqtt.py"]
CMD ["python3", "mqtt.py"]

# docker build . -t broadlink2mqtt
# docker run -it --name broadlink2mqtt -v data:/broadlink-mqtt/data broadlink2mqtt
#docker run -it -p 80:80 -p 443:443 -p 1883:1883 --name broadlink2mqtt -v data:/broadlink-mqtt/data broadlink2mqtt

#docker run --rm -it --network my-macvlan-net -p 80:80 -p 443:443 -p 1883:1883 -p 8883:8883 --name broadlink2mqtt -v broadlink_data:/broadlink-mqtt/data broadlink2mqtt
#docker run --rm -it --network my-macvlan-net -p 80:80 -p 443:443 -p 1883:1883 -p 8883:8883 --name broadlink2mqtt -v data:/broadlink-mqtt/data broadlink2mqtt


# docker commit -m "1st broadlink2mqtt img" -a "chris b" broadlink2mqtt chrispab/broadlink2mqtt:pi
# docker push chrispab/broadlink2mqtt
# docker login
# 
# dockebuild . -t broadlink2mqtt
# docker run --rm -it --network host -p 80:80 -p 443:443 -p 1883:1883 -p 8883:8883 --name broadlink2mqtt -v broadlink2mqtt:/broadlink-mqtt/data broadlink2mqtt


# works
# docker network create -d macvlan --subnet=192.168.0.0/24  --gateway=192.168.0.1 -o parent=eno1 my-macvlan-net
# dockerbuild . -t broadlink2mqtt
# docker run --rm -it --network my-macvlan-net -p 80:80 -p 443:443 -p 1883:1883 -p 8883:8883 --name broadlink2mqtt -v broadlink_data:/broadlink-mqtt/data broadlink2mqtt:latest


