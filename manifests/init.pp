# @summary
#  This is main class for hosts_manager module.
#
#  The host resource type installs and manages host entries in machine (both windows and redhat based linux).
#  It accepts hostname and ipaddress as string parameters.
#
# @example
#  class { 'ssh':
#     hostname  => 'hostname.server.name',
#     ipaddress => '109.131.4.22',
#  }
#
# @param hostname
#   hostname as a string value such as 'hostname.server'.
# @param ipaddress
#   ipaddress as a string value in valid ipaddress format such as '109.131.4.222'.
#
class hosts_manager (
  String $hostname,
  String $ipaddress,
){
  case $facts['kernel'] {
    'windows': {
      host { $hostname:
        ensure => 'present',
        ip     => $ipaddress,
        target => 'C:/Windows/System32/drivers/etc/hosts',
      }
    }
    default: {
        host { $hostname:
        ensure => 'present',
        ip     => $ipaddress,
        }
    }
  }
}
