# [arduino-cli](https://www.arduino.cc/pro/cli) in a container

With __pre-installed esp8266__ platform.

The entrypoint is the arduino binary itself.

Usage example

```sh
docker run --rm -it -v $PWD:/home/project -v /tmp:/tmp kovagoz/arduino-cli compile /home/project
```

For better efficiency, mount your host's temp folder to the container, so the
compiled files will be kept for further use.
