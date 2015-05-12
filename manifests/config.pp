class backupclient::config {
  require(backupclient::packages)

  # These are the client files generated on the bareos director server
  @@file { "/etc/bareos/bareos-dir.d/${::hostname}.conf":
    ensure  => file,
    content => template('backupclient/bareos-client.conf'),
    tag     => 'backupdir',
  }

  if $backupclient::encrypted == false {

    file { '/etc/bareos/bareos-fd.conf':
      ensure  => file,
      content => template('backupclient/bareos-fd.conf'),
      group   => bareos,
      mode    => '0640',
      notify  => Service[$backupclient::services],
    }

  } else {

    file { '/etc/bareos/client-pki/':
      ensure => directory,
      owner  => bareos,
      group  => bareos,
      mode   => '0700',
      notify => Service[$backupclient::services],
    }

    file { '/etc/bareos/client-pki/fd.pem':
      ensure => file,
      owner  => bareos,
      group  => bareos,
      mode   => '0600',
      notify => Service[$backupclient::services],
      source => 'puppet:///modules/backupclient/fd.pem',
    }

    file { '/etc/bareos/client-pki/master.cert':
      ensure => file,
      owner  => bareos,
      group  => bareos,
      mode   => '0600',
      notify => Service[$backupclient::services],
      source => 'puppet:///modules/backupclient/master.cert',
    }

    file { '/etc/bareos/bareos-fd.conf':
      ensure  => file,
      content => template('backupclient/bareos-fd.conf.encrypted'),
      group   => bareos,
      mode    => '0640',
      notify  => Service[$backupclient::services],
    }

  }
}
