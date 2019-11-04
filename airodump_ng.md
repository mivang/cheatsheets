## Airodump-ng

Airodump is used to actually sniff network packets from the monitor mode, we can
specify bands, channels, frequencies, and by default it will hop among channels
on the 2.4GHz band.
Notice that basically here we hop through channels, since a WNIC can only be on
a specific channel given a specific time *t*.

We can launch it with:
```sh
airodump-ng --wps wlan0mon -w outputfileprefix wlan0mon
```

We can press tab and then up/down to mark specific Access Points.

If an AP is selected or marked, all the connected stations will also be
selected or marked with the same color as the corresponding Access Point.

We can press space to pause/resume the redraw of the screen.

We can also sniff only traffic related to a specific AP, by doing:
```sh
airodump-ng --channel <id> --bssid <bssid> -w outputfileprefix wlan0mon
```

Another useful thing with airodump-ng is when we want to monitor on the 5GHz
band, in order to do this, we must explicitly use specific options.
We can monitor the 5GHz band by doing;
```sh
airodump-ng --band a --bssid --write mon0
```
