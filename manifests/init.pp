# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include hosts_manager
class hosts_manager (
  String $hostname, #'dummy.server11.com'
  String $ipaddress,#'109.131.4.222'
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
