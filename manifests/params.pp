# Class: sslh::params
#
# Set platform specific paramaters.
#

class sslh::params {
  # general config
  $service        = 'sslh'
  $service_ensure = 'running'
  $service_enable = true
  $run            = 'yes'
  $port_sslh      = '443'
  $port_ssl       = '443'
  $port_http      = '80'
  $port_ssh       = '22'
  $port_openvpn   = '1194'
  $port_xmpp      = '5222'
  $port_tinc      = '655'
  $user           = 'sslh'
  $package        = 'sslh'

  # OS specific config
  case $::operatingsystem {
    'debian': {
      $daemon   = '/usr/sbin/sslh'
      $config   = '/etc/default/sslh'
      $template = 'sslh/sslh-debian.erb'
      $pidfile  = '/var/run/sslh/sslh.pid'
    }
    #  'centos','fedora','rhel': {
    #$daemon = '/usr/sbin/sslh'
    #$config = '/etc/sysconfig/sslh'
    #$pidfile = '/var/run/sslh.pid' 
    #$template = 'sslh/sslh-centos.erb'
    #}
    #
    default: { fail("${::operatingsystem} is currently not supported by this sslh puppet module") }
  }
}
