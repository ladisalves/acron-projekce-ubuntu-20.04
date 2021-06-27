# Steps after a brand new installation

## Disable Printing System

```bash
systemctl stop cups-browsed
systemctl disable cups-browsed
systemctl stop cups.service
systemctl disable cups.service
```


## SSH Server Installation

- install ssh server

```bash
apt install openssh-server
```

- enable root login in /etc/ssh/sshd_config `PermitRootLogin` to `Yes`


## Lighttpd Installation

- install server

```bash
apt install lighttpd
```

- change a configuration in `/etc/lighttpd`, permit connections from 192.168.0.0 network by `10-cgi-custom.conf`
- change a server port to 89
- test http://your-ip:89/cgi-bin/generate-cgi.sh


## Remote Rates Setup

Change a IP address in `/opt/` - `generate-cgi.sh` and `generate.sh`

## Other stuff

Disable automatic updates.
