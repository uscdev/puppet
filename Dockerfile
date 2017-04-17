# USC puppet server - docker hub: uscits/puppet
FROM uscits/centos
MAINTAINER Don Corley [dcorley@usc.edu]

RUN yum -y install puppet-server

CMD ["/bin/bash"]
