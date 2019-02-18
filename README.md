# dev-environment

Instructions for setting up my **Ubuntu 18.04** dev environment on a Windows 10 computer

## WSL setup

1. Make sure you have **Windows 10 version 1809** or later
2. Follow the tutorial for setting up WSL here:  
   https://nickjanetakis.com/blog/using-wsl-and-mobaxterm-to-create-a-linux-dev-environment-on-windows  
   Notes:
   - Download **Ubuntu 18.04**
   - Skip the Docker setup for now

## git setup

1. Install:  
   ```
   sudo apt-get install git-core
   ```
2. Configure user:  
   ```
   git config --global user.name "name"
   git config --global user.email "name@example.com"
   ```
3. Create SSL key  
   ```
   ssh-keygen
   ```
4. Add SSL key to github
5. Branch autocompletion:
   ```
   sudo apt-get install git-core bash-completion
   ```

## rbenv, ruby, rails setup

1. Install rbenv and ruby-build (instructions borrowed from https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04):  
   ```
   sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
   echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
   echo 'eval "$(rbenv init -)"' >> ~/.bashrc
   source ~/.bashrc
   git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
   ```
2. Install latest ruby
3. Install essential gems:
   ```
   gem install bundler
   gem install rails
   rbenv rehash
   ```
4. IRB history -- add to ~/.irbc
   ```
   require 'irb/completion'
   require 'irb/ext/save-history'

   ARGV.concat [ "--readline",
                 "--prompt-mode",
                 "simple" ]

   # 100 entries in the list
   IRB.conf[:SAVE_HISTORY] = 100

   # Store results in home directory with specified file name
   IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
   ```

## nvm, node setup

Install nvm, node:
```
sudo apt-get install gcc g++ make
sudo apt-get install build-essential
sudo apt-get install libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
export NVM_DIR="/home/curtis/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

## Terminal customization

Add to `~/.bashrc`:
```
export PS1='\W \$ '
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
```

## SublimeText setup

