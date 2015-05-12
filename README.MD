## Synopsis  
  
Installs the bareos-fd backup client and populates the client config for the director to pickup from puppetdb as an exported resource.  
  
## Example  
  
Defaults are stored in params.pp.  
  
## Motivation  
  
Created to provide an inexpensive backup solution for our infrastructure and developmental environments and MariaDB databases.  
  
## Installation  
  
Tested working on CentOS 6.  
Requires the bareos repository http://doc.bareos.org/master/html/bareos-manual-main-reference.html#x1-260002.1  
Requires a working puppetdb installation to be setup in puppetmaster.  
backupdir module will populate client configs on the bareos director.  
Requires master.cert and fd.pem to be created for data encryption to be enabled, see http://doc.bareos.org/master/html/bareos-manual-main-reference.html#x1-29800027.2  
Supports mysqldump backup plugin. For configuration see https://github.com/bareos/bareos-contrib/tree/master/fd-plugins/mysql-python  
  
## API Reference  
  
director => director name  
password => director password, REQUIRED  
encrypted => boolean, whether or not to enable data encryption, requires master.cert/fd.pem  
  
## Contributors  
  
Ryan Munz for Giftcards.com - May 2015  
