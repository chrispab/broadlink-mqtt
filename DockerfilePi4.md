## How to build, push and use a container for using broadlink-mqtt on a Pi 4 running IOTstack


### To build the image
clone this repo to a Raspberry Pi that has docker installed. If using IOTstack clone into ~/IOTstack/volumes/

cd into repo dir

```console
$ docker build -f DockerfilePi4 -t broadlink-mqtt:pi4 .
```
### Run the container, and observe the output to confirm the code is running ok:
```console
$ docker run --rm -it --network host --name broadlink-mqtt -v ~/IOTstack/volumes/broadlink-mqtt:/broadlink-mqtt  broadlink-mqtt:pi4
```
Leave the container running for commiting and pushing (as below), or remove --rm from above command prevent removal of the container if stopped

### commit and push to dockerhub
```console
$ docker login
$ docker commit  broadlink-mqtt chrispab/broadlink-mqtt:pi4
$ docker push chrispab/broadlink-mqtt:pi4
```

## To use the image from dockerhub in Pi4 IOTstack
note: the image is setup as a dev enviroment - and as such no source files are copied into the image when its built using DockerfilePi4.

Note: the entry point to execute the code is always `$ python mqtt.py`

### Placing the source code in IOTstack
1. clone the github broadlink-mqtt repo (master branch) into the location mapped into(and over) the image code dir.
e.g for IOTstack, cd into ~/IOTstack/volumes, and clone the repo

`git clone https://github.com/chrispab/broadlink-mqtt.git`

or

`git clone git@github.com:chrispab/broadlink-mqtt.git`
### So you end up with structure:
`~/IOTstack/volumes/broadlink-mqtt/(repo contents here)`

This copies the whole repo to the host folder `~/IOTstack/volumes/broadlink-mqtt`. then thats overlayed on the container dir `/broadlink-mqtt` when you 'run' the container with `-v ~/IOTstack/volumes/broadlink-mqtt:/broadlink-mqtt`

You can edit code in here, and restart the container to see the results without having to re-build and push each time you make a mod.

## To add to IOTStack dockercompose.yml file:
The compose file for use on IOTstack `dockercompose.yml`
```yaml
  broadlink-mqtt:
    container_name: broadlink-mqtt
    image: chrispab/broadlink-mqtt:pi4
    volumes:
      - ./volumes/broadlink-mqtt:/broadlink-mqtt
    restart: unless-stopped
    network_mode: host
```

then in iotstack, to refetch and run the new container:

``` yaml
$ cd ~/IOTstack
$ docker-compose up -d broadlink-mqtt
```
or

```yaml
$ docker-compose up -d
```

you may need to create a mqtt.log file in the source folder and adjust perms


```yaml
version: '3.6'
services:

  broadlink2mqtt:
    container_name: broadlink2mqtt
    image: chrispab/broadlink2mqtt:buster_1
    volumes:
      - ./volumes/broadlink2mqtt/data:/app/data
    restart: unless-stopped
    network_mode: host
    
```


adding

BG Electrical AHC/U-01 0x51e2