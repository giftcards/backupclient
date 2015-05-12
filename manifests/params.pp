class backupclient::params {
  $director = [ 'infra-bareos01' ]
  $packages = [ 'bareos-filedaemon', 'bareos-filedaemon-python-plugin', 'bareos-contrib-filedaemon-python-plugin-mysql' ]
  $encrypted = false
  $services = [ 'bareos-fd' ]
}
