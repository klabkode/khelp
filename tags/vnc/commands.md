# VNC_commands

```bash
vncconfig  -nowin &
vncconfig -iconic &
xsetroot -solid grey
```

```bash
autocutsel -fork
x-window-manager &
```

```bash
x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
```

## Run_command

```bash
vncserver -kill :1 && vncserver :1
```
