# ansible_automation
Ansible automation scripts for setting up a new mac machine

## TODO

- [] VM for testing automation changes??
- [] Pull secrets from 1Password or ansible-vault
- [] Yubikey
- [] Switch to chezmoi for dotfiles management
- [] Should be able to target machine via SSH
  - Right now I am copy-pasting the bootstrap file and running that; should improve, not the end of the world

## Approach

Thinking of going with this dir structure
```shell
ansible-automation/
├── bootstrap.sh
├── playbook.yml
├── inventory/
│   └── localhost.ini
├── roles/
│   ├── common/
│   │   └── tasks/main.yml
│   ├── dotfiles/
│   │   └── tasks/main.yml
│   ├── macos/
│   │   └── tasks/main.yml
│   ├── apps_common/
│   │   └── tasks/main.yml
│   ├── apps_personal/
│   │   └── tasks/main.yml
│   └── apps_work/
│       └── tasks/main.yml
```