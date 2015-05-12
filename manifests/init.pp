class backupclient (

  $director = $backupclient::params::director,
  $encrypted = $backupclient::params::encrypted,
  $password,

) inherits backupclient::params {

  $packages = $backupclient::params::packages
  $services = $backupclient::params::services

  include backupclient::packages
  include backupclient::config
  include backupclient::services

}
