class backupclient::services {
  require(backupclient::config)
  require(backupclient::packages)

  Service {
    ensure     => running,
    enable     => true,
    require    => Package [ $backupclient::packages ],
  }

  service { $backupclient::services: }
}
