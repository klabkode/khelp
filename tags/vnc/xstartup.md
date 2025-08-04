# Xstatup file for VNC server

## For Gnome desktop

```bash
#!/bin/sh
vncconfig -iconic &
dbus-launch --exit-with-session gnome-session &
```

## For XFCE desktop

```bash
#!/bin/sh
vncconfig  -nowin &
autocutsel -fork
i3 &
```
