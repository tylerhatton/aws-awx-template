sudo yum install -y git docker python3-pip gcc openssl-devel bzip2-devel libffi-devel 
sudo pip3 install docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user

cd /opt
sudo wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tgz 
sudo tar xzf Python-3.9.16.tgz 
cd Python-3.9.16 
sudo ./configure --enable-optimizations 
sudo make altinstall 
sudo rm -f /opt/Python-3.9.16.tgz

sudo python3 -m pip install ansible
sudo sysctl fs.inotify.max_user_watches=20000

cd ~
git clone -b 21.11.0 https://github.com/ansible/awx.git
cd awx
# set secrets under tools/docker-compose/inventory
