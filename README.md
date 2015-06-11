# Overview
A puppet module for sslh - Applicative protocol multiplexer (https://github.com/yrutschle/sslh)

This module is meant for Debian at the moment. It can still use a lot of additions and contributions, so feel free to add yours.

It currently supports multiplexing of

* ssl (https)
* http
* ssh
* openvpn
* xmpp
* tinc

## Supported Platforms

* Linux
	* Debian

# Requirements

puppetlabs/stdlib for param validation checking

## Usage
Example to use sslh to multiplex ssh, https (=ssl) and openvpn

```
class { 'sslh':
  listen_ssl     => '127.0.0.1',
  port_ssl       => '8443',
  listen_ssh     => '127.0.0.1',
  port_ssh       => '22',
  listen_openvpn => 'myremoteserver.domain',
  port_openvpn   => '1194',
}
```
