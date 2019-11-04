# Monitor Mode

To put a wireless card in monitor mode we may do:

```sh
airmon-ng check kill
airmon-ng start 
ifconfig -a
ifconfig wlan0mon up
```

Now we can start the sniffing from wireshark.
