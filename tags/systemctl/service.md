# Bash Commands to Manage Services

## Using service

```bash
sudo service ssh start
sudo service ssh stop
sudo service ssh status
```

## Using systemctl

```bash
sudo systemctl start  sshd.service
sudo systemctl enable sshd.service
sudo systemctl status sshd.service
```
