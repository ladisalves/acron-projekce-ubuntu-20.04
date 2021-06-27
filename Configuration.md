# Steps after a brand new installation

## Disable printing system

```bash
systemctl stop cups-browsed
systemctl disable cups-browsed
systemctl stop cups.service
systemctl disable cups.service
```


## SSH server installation

- install ssh server

```bash
apt install ssh-server
```

- enable root login in /etc/ssh/sshd_config `PermitRootLogin` to `Yes`


## lighttpd installation

- install server

```bash
apt install lighttpd
```

- take configuration in `/etc/

