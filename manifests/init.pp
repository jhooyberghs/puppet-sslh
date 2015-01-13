# Class: sslh
#

class sslh (
	$run						= 'yes',
	$daemon         = $sslh::params::daemon,
	$config         = $sslh::params::config,
	$template				= $sslh::params::template,
	$pidfile        = $sslh::params::pidfile,
	$user						= $sslh::params::user,
	$port_sslh			= $sslh::params::port_sslh,
	$port_ssl		  	= $sslh::params::port_ssl,
	$port_http		  = $sslh::params::port_http,
	$port_ssh			  = $sslh::params::port_ssh,
	$port_openvpn   = $sslh::params::port_openvpn,
	$port_xmpp	  	= $sslh::params::port_xmpp,
	$port_tinc	  	= $sslh::params::port_tinc,
	$listen_sslh    = '0.0.0.0',
	$listen_ssl		  = undef,
	$listen_http	  =	undef,
	$listen_ssh		  = undef,
	$listen_openvpn = undef,
	$listen_xmpp		= undef,
	$listen_tinc		= undef,
	$supported_apps = ['ssl','http','ssh','openvpn','xmpp','tinc'],
) inherits sslh::params {

	package { 'sslh':
		ensure => installed,
	} ~>

	file { $config:
		content => template($template)
	} ~>

	service { 'sslh':
		ensure => running,
		enable => true,
	}


}
