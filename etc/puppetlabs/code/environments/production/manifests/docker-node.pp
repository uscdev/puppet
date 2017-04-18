node docker-node {

  class {'docker':
    socket_bind  => 'unix:///var/run/docker.sock',
    dns          => '8.8.8.8',
    docker_users => [ 'user1', 'user2' ],
  }
 
}
