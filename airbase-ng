# Creating Hotspots

We can create hotspots with different configurations with airbase-ng, let's see
common scenarios:

```sh
airmon-ng start wlan0
# we can launch it as many times depending on the number
# of virtual interfaces (or hotspots) we want to create.
```

We can for example create multiple interfaces by launching multiple times the
previous command and set them up with different configurations.


## Open Authentication WLAN

```sh
airbase-ng --essid <name> -a aa:aa:aa:aa:aa:aa -c 1 mon1
```


## WEP Authentication WLAN

```sh
airbase-ng --essid <name> -a bb:bb:bb:bb:bb:bb -c 1 -W 1 mon2
# -W 1 allows us to set to 1 the encryption bit and
# in this case, since no other option is specified 
# the WEP authentication mechanism will be enabled
```


## WPA Authentication WLAN

```sh
airbase-ng --essid <name> -a cc:cc:cc:cc:cc:cc -c 1 -W 1 -z 2 mon3
# -W 1 allows us to set to 1 the encryption bit
# the -z 2 allows to use WPA with TKIP mechanism
```


## WPA2 Authentication WLAN

```sh
airbase-ng --essid <name> -a dd:dd:dd:dd:dd:dd -c 1 -W 1 -Z 4 mon4
# -W 1 allows us to set to 1 the encryption bit
# the -Z 2 allows to use WPA2 with CCMP mechanism
```


