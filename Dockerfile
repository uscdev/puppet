# USC puppet server - docker hub: uscits/puppet
FROM uscits/centos
MAINTAINER Don Corley [dcorley@usc.edu]

RUN useradd puppet
RUN usermod -aG puppet puppet
RUN usermod -aG puppet root
RUN rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
RUN yum install -y puppetserver
# RUN /opt/puppetlabs/puppet/bin/puppet resource package puppet-server ensure=latest
copy etc /etc

RUN sed -i 's/puppet settings./puppet settings.\n\[main\]\n    dns_alt_names = puppet,puppet.docker,puppet.docker.usc.edu/' etc/puppetlabs/puppet/puppet.conf
RUN /opt/puppetlabs/puppet/bin/puppet module install puppetlabs/docker_platform

CMD ["/opt/puppetlabs/bin/puppetserver", "foreground"]
