
FROM debian:stretch

RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python3 python3-dev git python3-pip python3-setuptools
# RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python-dev git python-pip python-setuptools

# RUN git clone https://github.com/chrispab/broadlink-mqtt.git
RUN mkdir -p /broadlink-mqtt
COPY . /broadlink-mqtt

WORKDIR /broadlink-mqtt

# RUN pip3 install -r requirements.txt
RUN pip3 install -r requirements.txt

# ENTRYPOINT [ "python3" ]

# CMD [ "mqtt.py" ]

# CMD ["python3", "mqtt.py"]
CMD ["python3", "mqtt.py"]

# docker build . -t broadlink2mqtt
# docker run -it --name broadlink2mqtt -v data:/broadlink-mqtt/data broadlink2mqtt