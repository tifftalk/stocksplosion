sudo apt-get update

# Install Ruby and Rails
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
sudo chown -R vagrant:vagrant .rbenv
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
sudo chown -R vagrant:vagrant .rbenv
exec $SHELL

git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
sudo chown -R vagrant:vagrant .rbenv

rbenv install 2.2.1
rbenv global 2.2.1

sudo chown -R vagrant:vagrant /var/lib/gems
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
gem install sinatra
gem install rspec

# initialize rspec for the project
# cd /vagrant
## rspec --init
# bundle install #--binstubs  