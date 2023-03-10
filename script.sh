
sudo dnf install docker-ce --nobest --allowerasing -y
sudo systemctl start docker
sudo systemctl enable docker

# create awx user
sudo useradd -m -s /bin/bash awx

# add user to docker group
sudo usermod -a -G docker awx

sudo yum install python39

sudo python3.9 -m pip install ansible
sudo python3.9 -m pip install docker-compose


sudo sysctl fs.inotify.max_user_watches=20000

cd ~
git clone -b 21.11.0 https://github.com/ansible/awx.git
cd awx
# set secrets under tools/docker-compose/inventory
make docker-compose-build
make docker-compose
docker exec tools_awx_1 make clean-ui ui-devel
docker exec -ti tools_awx_1 awx-manage createsuperuser
