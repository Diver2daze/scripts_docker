sudo yum update
curl -O -sSL https://get.docker.com/rpm/1.7.0/centos-7/RPMS/x86_64/docker-engine-1.7.0-1.el7.centos.x86_64.rpm
sudo yum localinstall --nogpgcheck docker-engine-1.7.0-1.el6.x86_64.rpm
sudo service docker start

## running test image
sudo docker run hello-world
##there should be any error if install was seccessfull 

sudo chkconfig docker on


