# Bypassing Captive Portals


## Before Installing a DNS Tunnel

Before even going to install a DNS tunnel, we can just try to create an SSH
tunnel which uses the open ports of the captive portal, so we can check
them with nmap and then try an ssh tunnel which creates a proxy with:

```sh
ssh -p <ssh_port> -D <localport> -N user@<ip>
# where ssh_port is the port used to connect to ssh, which by defualt is 22
# and localport is the port which will be open on my localhost to provide the
# proxy service, notice that this proxy is SOCKS5.
```


This should not work, but sometimes it works.
If we see that nslookups are working for basically any domain, we can then use the 
following solution which is related to the installation of a DNS tunnel.


## Install DNS Tunnel


At this point the best option is to have a situation like this on our registrar
or to our DNS system:
```txt
* `A record`: tunnelhost -> your ip (maps tunnelhost.yourdomain.com to your server's ip)
* `NS record`: tunnel -> tunnelhost.yourdomain.com
```

Basically `tunnelhost.example.com` now points to `<ip>`
 `tunnel.example.com` now points to `tunnelhost.example.com`.

Iodine is widely used, anyway a faster fork is provided by this repository:
[faster iodine](https://github.com/frekky/iodine)

Let's say we have a domain called `mydomain.com`, pointing to the IP address
of our remote server, that is 7.7.7.7.
We can install iodine on the server, and then launch it with:

```sh
 iodined -c -f 10.0.0.1 -P aSamplePassword998734! tunnel.example.com
 # This is done on the server 7.7.7.7
 # with -c we don't check the incoming IP address
 # the IP address inserted 10.0.0.1 is just a local IP address we will use
 # to be addressable by the client machine in the network, we could choose
 # any local IP address
 # with -f we run it in foreground
 # with -P we specify a password
```

At this point we can check that our configuration is correct from here:
[Test DNS Tunnel](http://code.kryo.se/iodine/check-it/)
Notice that we should insert "tunnel.example.com".

On the client side we can do:

```sh
 sudo iodine -f -P aSamplePassword998734! tunnel.example.com
```
Ok now it may not work at the first attempt, we may need to change something,
this is what I experienced in the past:
* if it does not find a suitable fragment size, try to set -M 200 or lower
  (better), something like 150, or 100
* we may need to change the type of DNS queries although they should be detected
  automatically, anyway we can force this with -T CNAME (or any other query we
  want)
* we may need to use the `-r` option to force the use of DNS requests instead of
  plain UDP channel usage, To force DNS tunneling in any case, use the
  -r option (especially useful when testing within your own network).

So more robust launch of iodine may be:
```sh
 sudo iodine -r -f -P aSamplePassword998734! tunnel.example.com
```
or 
```sh
 sudo iodine -M 110 -f -P aSamplePassword998734! tunnel.example.com
```
or combination of both:
```sh
 sudo iodine -M 110 -r -f -P aSamplePassword998734! tunnel.example.com
```


## Test DNS Tunnel setup

To make sure the DNS tunnel is setup correctly, you can:

Run ifconfig (on your client) and make sure there is a tun0 entry like this:

```sh
 ifconfig
 # check the presence of a tun0 or dns0 interface
```

Let's try to ping the other end:
```sh
 ping 10.0.0.1
```

At this point we could also ssh to our remote machine or do anything 
remotely to our machine.

```sh
ssh -p22 user@10.0.0.1
```


## Use DNS Tunnel as Web Proxy

Next, we are going to setup an SSH tunnel INSIDE of the DNS Tunnel. 
This will both setup a SOCKS proxy that will allow you to direct your network traffic through,
and will secure your network traffic (at least between you and your server).
For more information on SSH Tunneling and how it works, check out this article.


To setup an SSH Tunnel we can do:
```sh
ssh -p22 -D 5000 -N user@10.0.0.1
```

Now we can redirect traffic on that proxy by setting from firefox a SOCKS5
proxy on 127.0.0.1:5000; but before doing it, we can test our proxy by
executing:

```sh
curl --socks5-hostname 127.0.0.1:5000 http://httpbin.org/ip
```


