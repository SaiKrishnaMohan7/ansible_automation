# ansible_automation
Ansible automation scripts for setting up a new mac machine

## TODO

- [] VM for testing automation changes

## Approach

- scripts/install.sh
  - install brew as a LOT depends on its existence
  - install ansible via brew
  - install git
  - install ohmyzsh if not exist (this check will handled by ansible)
    - nuke the zshrc so the one pulled in by yadm can be usedk
  - install yadm via brew
    - yadm clone your dotfiles repo
    - Replace the .zshrc created/modified by ohmyzsh installation with the one in dotfiles
      - Best way is to replace, need to see shell commands for that (maybe rm zshrc before yadm clone?
  - install powerlevel10k from scripts/install.sh
    - configure this manually
  - install zsh-autosuggestions
  - install rust
- Install homebrew packages
- Install homevrew cask packages

had to run this ansible-galaxy collection install community.general


## Debug

- There is a logfile taht has been commited, use that to debug later
- [Your /reddit post](https://www.reddit.com/r/ansible/comments/zvyky9/ansible_stuck_at_gathering_facts_when_trying_to/)
- [Ask differernt post](https://apple.stackexchange.com/questions/452425/ansible-stuck-at-gathering-facts-when-trying-to-run-playbook-to-configure-mac-ru)
