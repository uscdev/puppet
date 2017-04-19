node default {

  class { "ntp":
    servers => [ '0.us.pool.ntp.org iburst', '1.us.pool.ntp.org iburst', '2.us.pool.ntp.org iburst',
      '3.us.pool.ntp.org iburst'],
  }

  class { '::nfs':
    client_enabled => true,
  }

}

node 'zz' {

  file { '/mnt/docker/disk2':
    ensure => 'directory',
  }
  file { '/mnt/docker/nfs':
    ensure => 'directory',
  }

  nfs::client::mount { '/mnt/docker/nfs':
    server => 'cal-nfs1',
    share => 'dcorley-swarm-test/nfs',
  }

  resources { 'firewall':
      purge => true,
    }

    Firewall {
    before  => Class['my_firewall::post'],
    require => Class['my_firewall::pre'],
  }

  class { ['my_firewall::pre', 'my_firewall::post']: }

  class { 'firewall': }
}
