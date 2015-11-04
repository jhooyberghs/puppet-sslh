# Class: sslh
#

class sslh (
  $service        = $sslh::params::service,
  $service_ensure = $sslh::params::service_ensure,
  $service_enable = $sslh::params::service_enable,
  $run            = $sslh::params::run,
  $daemon         = $sslh::params::daemon,
  $config         = $sslh::params::config,
  $template       = $sslh::params::template,
  $source         = undef,
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
  # validate params
  validate_string( $service_ensure, 'running', 'stopped')
  validate_string( $run, 'yes', 'no')
  validate_bool( $service_enable )

  if (( $listen_sslh ) and ( ! is_ip_address($listen_sslh) )) {
      fail("Invalid IP address ${listen_sslh}")
  }
  validate_re($port_ssl, '^[0-9]{1,5}$', "Invalid port: ${port_ssl}")
  validate_re($port_http, '^[0-9]{1,5}$', "Invalid port: ${port_http}")
  validate_re($port_ssh, '^[0-9]{1,5}$', "Invalid port: ${port_ssh}")
  validate_re($port_openvpn, '^[0-9]{1,5}$', "Invalid port: ${port_openvpn}")
  validate_re($port_xmpp, '^[0-9]{1,5}$', "Invalid port: ${port_xmpp}")
  validate_re($port_tinc, '^[0-9]{1,5}$', "Invalid port: ${port_tinc}")

  package { $package:
    ensure => present,
  }

  if $source {
    file { $config:
      source => $source,
    }
  }
  else {
    file { $config:
      content => template($template),
      notify  => Service[$service],
    }
  }

  service { $service:
    ensure  => $service_ensure,
    enable  => $service_enable,
    require => File[$config],
  }

}
