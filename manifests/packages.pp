class backupclient::packages {
  package { $backupclient::packages:
    ensure => installed,
    notify => Service[$backupclient::services],
  }
}
