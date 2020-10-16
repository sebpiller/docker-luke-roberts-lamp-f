# docker Luke Roberts Lamp F CLI

Luke Roberts Lamp F CLI packaged as a docker image.

```shell script
docker login
docker buildx create --name mybuilder
docker buildx use mybuilder
```

```shell script
docker buildx build --platform linux/arm/v7,linux/amd64 -t sebpiller/lamp_f:latest --push .
```

```shell script
mkdir -p /home/spiller/docker/sebpiller/lamp_f 
docker buildx build --platform linux/arm/v7,linux/amd64 -t sebpiller/lamp_f:latest --output type=local,dest=/home/spiller/docker/sebpiller/lamp_f .
```

Access BT adapter from container
```shell script
docker run --rm --net=host --privileged -it sebpiller/lamp_f:latest

java -jar /luke-roberts-lamp-f-cli-LATEST.jar --script embedded:alarm
```
