node 'dcorley-swarm-node01','dcorley-swarm-node02','dcorley-swarm-node03' {

  class {'docker':
    socket_bind  => 'unix:///var/run/docker.sock',
    dns          => '8.8.8.8',
    docker_users => [ 'user1', 'user2' ],
  }
 
}
