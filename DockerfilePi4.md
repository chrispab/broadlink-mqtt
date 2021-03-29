### To build the image
```
$ docker build -f DockerfilePi4 -t broadlink-mqtt:pi4 .
```
### Run the container, and observe the output to confirm the code is running ok:
```
$ docker run --rm -it --network host --name broadlink-mqtt -v ~/IOTstack/volumes/broadlink-mqtt:/broadlink-mqtt  broadlink-mqtt:pi4
```
Leave the container running for commiting and pushing (as below), or remove --rm from above command prevent removal of the container if stopped

### commit and push to dokerhub
```
$ docker login
$ docker commit  broadlink-mqtt chrispab/broadlink-mqtt:pi4
$ docker push chrispab/broadlink-mqtt:pi4
```

## To use the image from dockerhub in Pi4 IOTstack
note: the image is setup as a dev enviroment - and as such no source files are copied into the image when its built using DockerfilePi4.

Note: the entry point to execure the code is always `$ python mqtt.py`

### Placing the source code in IOTstack
1. clone the github broadlink-mqtt repo (master branch) into the location mapped into(and over) the image code dir.
e.g for IOTstack, cd into ~/IOTstack/volumes, and clone the repo

`git clone https://github.com/chrispab/broadlink-mqtt.git`

or

`git clone git@github.com:chrispab/broadlink-mqtt.git`
### So you end up with structure:
`~/IOTstack/volumes/broadlink-mqtt/(repo contents here)`

You can edit code in here, and restart the container to see the results without having to re-build and push each time you make a mod.

## To add to IOTStack dockercompose.yml file:
The compose file for use on IOTstack `dockercompose.yml`
```
  broadlink-mqtt:
    container_name: broadlink-mqtt
    # image: chrispab/broadlink-mqtt:latest
    image: chrispab/broadlink-mqtt:pi4
    volumes:
      - ./volumes/broadlink-mqtt:/broadlink-mqtt
    ports:
      - "80:80"
      - "443:443"
      - "1884:1883"
    restart: unless-stopped
    network_mode: host
```

then in iotstack, to refetch and run the new container:


$ cd ~/IOTstack
$ docker-compose up -d «container»
$ docker-compose up -d



```
version: '3.6'
services:

  broadlink2mqtt:
    container_name: broadlink2mqtt
    image: chrispab/broadlink2mqtt:buster_1
    # image: chrispab/broadlink2mqtt:test1
    volumes:
      - ./volumes/broadlink2mqtt/data:/app/data
      # - ./volumes/broadlink2mqtt/data:/app/data
      # - type: bind
      #   source: ./volumes/broadlink2mqtt/data
      #   target: /broadlink/data
    ports:
      - "80:80"
      - "443:443"
      - "1884:1883"
    restart: unless-stopped
    network_mode: host
    
```


