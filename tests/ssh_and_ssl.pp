# sslh test class

class { 'sslh':
  listen_ssl => '127.0.0.1',
  listen_ssh => '127.0.0.1',
}
