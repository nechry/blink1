# blink1

Ubuntu with blink1-tool and blink1-tiny-server.

## Usage

```
$ docker pull nechry/blink1
```

Your Docker host probably needs to have `lsusb` and `udev` installed. On most Linux distributions they'll be there by default.

```
$ lsusb | grep blink
Bus 003 Device 003: ID 27b8:01ed ThingM blink(1)
```

That means that your blink(1) will be device `/dev/bus/usb/003/003`.

To run the container with the `blink1-tiny-server` running on port 8080:

```
$ docker run -d -p 8080:8080 --name blink1 --device=/dev/bus/usb/003/003 nechry/blink1
```

OR

```
$ docker run -d -p 8080:8080 --name blink1 --privileged nechry/blink1
```

To use the `blink1-tool` command:

```
$ docker exec blink1 blink1-tool --list
blink(1) list:
id:0 - serialnum:{{your blink serial number}} (mk2)
```


## Reference

1. [Alpine Linux](http://alpinelinux.org)
2. [blink(1)](blink1.thingm.com)
3. [Offical blink(1) Tools](https://github.com/todbot/blink1-tool)
