# FROM python:latest
# FROM python:3

#use deb buster base as smaller than python base 500m v 720m
FROM debian:buster
RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python3 python3-dev git python3-pip python3-setuptools apt-utils

# RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python-dev git python-pip python-setuptools

# RUN apt-get install build-essential libssl-dev libffi-dev python3-dev cargo
# RUN python3 -m pip install 
#--no-use-pep517 cryptography
#  RUN pip install --upgrade pip
# RUN pip3 install --upgrade pip setuptools wheel
# RUN pip install --upgrade pip
RUN pip3 install paho-mqtt
RUN pip3 install cryptography==3.2
# RUN pip3 install rust

RUN pip3 install broadlink
#>=0.15.0

RUN mkdir -p /app/data
# ID=$(id -u)
WORKDIR /app

COPY . .
RUN ls
RUN cd data && ls

# WORKDIR /app
RUN echo 'image created!'
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


# for buster base
# docker build -t broadlink2mqtt .
# docker run --rm -it --network host --name broadlink2mqtt -v ~/IOTstack/volumes/bltest1/data:/app/data  broadlink2mqtt:buster_1
# docker login
# docker commit  broadlink2mqtt chrispab/broadlink2mqtt:buster_1
# docker push chrispab/broadlink2mqtt:buster_1



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

# note use cryptography==3.2 or it breaks


# Found custom config
# looking for device(s)!
# device_type: multiple_lookup
# [broadlink.switch.sp4b(('192.168.0.18', 80), mac=b'$\xdf\xa7\xa4\xcc\xec', devtype=20962, timeout=10, name='adapter', model='AHC/U-01', manufacturer='BG Electrical', is_locked=False), broadlink.switch.bg1(('192.168.0.10', 80), mac=b'\xc8\xf7B\xfcT\xbd', devtype=20963, timeout=10, name='socket', model='BG800/BG900', manufacturer='BG Electrical', is_locked=False), broadlink.switch.sp4b(('192.168.0.28', 80), mac=b'$\xdf\xa7\xa4\xc6\xec', devtype=20962, timeout=10, name='adapter', model='AHC/U-01', manufacturer='BG Electrical', is_locked=False)]
# adapter (BG Electrical AHC/U-01 0x51e2 / 192.168.0.18:80 / 24:DF:A7:A4:CC:EC) broadlink/ SP4B_ec_cc_a4_a7_df_24/
# [2021-03-25 10:11:46,688] DEBUG Connected to 'SP4B' Broadlink device at '192.168.0.18' (MAC ec:cc:a4:a7:df:24) and started listening for commands at MQTT topic having prefix 'broadlink/SP4B_ec_cc_a4_a7_df_24/' 
# [broadlink.switch.sp4b(('192.168.0.18', 80), mac=b'$\xdf\xa7\xa4\xcc\xec', devtype=20962, timeout=10, name='adapter', model='AHC/U-01', manufacturer='BG Electrical', is_locked=False), broadlink.switch.bg1(('192.168.0.10', 80), mac=b'\xc8\xf7B\xfcT\xbd', devtype=20963, timeout=10, name='socket', model='BG800/BG900', manufacturer='BG Electrical', is_locked=False), broadlink.switch.sp4b(('192.168.0.28', 80), mac=b'$\xdf\xa7\xa4\xc6\xec', devtype=20962, timeout=10, name='adapter', model='AHC/U-01', manufacturer='BG Electrical', is_locked=False)]
# socket (BG Electrical BG800/BG900 0x51e3 / 192.168.0.10:80 / C8:F7:42:FC:54:BD) broadlink/ BG1_bd_54_fc_42_f7_c8/
# [2021-03-25 10:11:46,704] DEBUG Connected to 'BG1' Broadlink device at '192.168.0.10' (MAC bd:54:fc:42:f7:c8) and started listening for commands at MQTT topic having prefix 'broadlink/BG1_bd_54_fc_42_f7_c8/' 
# [broadlink.switch.sp4b(('192.168.0.18', 80), mac=b'$\xdf\xa7\xa4\xcc\xec', devtype=20962, timeout=10, name='adapter', model='AHC/U-01', manufacturer='BG Electrical', is_locked=False), broadlink.switch.bg1(('192.168.0.10', 80), mac=b'\xc8\xf7B\xfcT\xbd', devtype=20963, timeout=10, name='socket', model='BG800/BG900', manufacturer='BG Electrical', is_locked=False), broadlink.switch.sp4b(('192.168.0.28', 80), mac=b'$\xdf\xa7\xa4\xc6\xec', devtype=20962, timeout=10, name='adapter', model='AHC/U-01', manufacturer='BG Electrical', is_locked=False)]
# adapter (BG Electrical AHC/U-01 0x51e2 / 192.168.0.28:80 / 24:DF:A7:A4:C6:EC) broadlink/ SP4B_ec_c6_a4_a7_df_24/
# [2021-03-25 10:11:46,726] DEBUG Connected to 'SP4B' Broadlink device at '192.168.0.28' (MAC ec:c6:a4:a7:df:24) and started listening for commands at MQTT topic having prefix 'broadlink/SP4B_ec_c6_a4_a7_df_24/' 