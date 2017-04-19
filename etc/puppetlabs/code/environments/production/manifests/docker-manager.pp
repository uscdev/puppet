node 'dcorley-swarm-mgr01' {

  class {'docker':
    tcp_bind     => 'tcp://127.0.0.1:2376',
    socket_bind  => 'unix:///var/run/docker.sock',
    dns          => '8.8.8.8',
    docker_users => [ 'user1', 'user2' ],
  }
  
}
