# Class: sslh
#

class sslh (
  $service        = $sslh::params::service,
  $running        = $sslh::params::running,
  $run            = $sslh::params::run,
  $enable         = $sslh::params::enable,
  $daemon         = $sslh::params::daemon,
  $config         = $sslh::params::config,
  $template       = $sslh::params::template,
  $pidfile        = $sslh::params::pidfile,
  $user           = $sslh::params::user,
  $package        = $sslh::params::package,
  $port_sslh      = $sslh::params::port_sslh,
  $port_ssl       = $sslh::params::port_ssl,
  $port_http      = $sslh::params::port_http,
  $port_ssh       = $sslh::params::port_ssh,
  $port_openvpn   = $sslh::params::port_openvpn,
  $port_xmpp      = $sslh::params::port_xmpp,
  $port_tinc      = $sslh::params::port_tinc,
  $listen_sslh    = '0.0.0.0',
  $listen_ssl     = undef,
  $listen_http    = undef,
  $listen_ssh     = undef,
  $listen_openvpn = undef,
  $listen_xmpp    = undef,
  $listen_tinc    = undef,
) inherits sslh::params {

  package { $package:
    ensure => present,
  }

  file { $config:
    content => template($template),
    notify  => Service[$service],
  }

  service { 'sslh':
    ensure  => $running,
    enable  => $enable,
    require => File[$config],
  }

}
