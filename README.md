# puppet
Puppet Server

To configure a system:

````
yum -y update && yum -y upgrade
rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install puppet-agent

/opt/puppetlabs/bin/puppet agent --test --server puppet.docker.usc.edu --waitforcert 3
````
Note: Server can be specified in the /etc/puppetlabs/puppet/puppet.conf files:
````
[main]
server=puppet.docker.usc.edu
````

Then, sign on to the puppet server and accept the certificates:
````
/opt/puppetlabs/bin/puppet cert list
/opt/puppetlabs/bin/puppet cert sign *hostname*
````
