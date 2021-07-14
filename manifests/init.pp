# == Class: opendkim
#
#This class manages the opendkim service.
#
#Please see the README.md
class opendkim(
  String                    $user                 = $opendkim::params::user,
  String                    $group                = $opendkim::params::group,
  Integer[-1]               $uid                  = $opendkim::params::uid,
  Integer[-1]               $gid                  = $opendkim::params::gid,

  Stdlib::Absolutepath      $homedir              = $opendkim::params::homedir,
  Stdlib::Absolutepath      $configdir            = $opendkim::params::configdir,
  Stdlib::Absolutepath      $configfile           = $opendkim::params::configfile,
  Stdlib::Absolutepath      $pidfile              = $opendkim::params::pidfile,
  Optional[Stdlib::Absolutepath] $sysconfigfile   = $opendkim::params::sysconfigfile,
  String                    $package_name         = $opendkim::params::package_name,
  String                    $syslog               = $opendkim::params::syslog,
  String                    $syslog_success       = $opendkim::params::syslog_success,
  String                    $log_why              = $opendkim::params::log_why,
  String                    $subdomains           = $opendkim::params::subdomains,
  String                    $socket               = $opendkim::params::socket,
  String                    $umask                = $opendkim::params::umask,
  Boolean                   $use_statistics       = $opendkim::params::use_statistics,
  Stdlib::Absolutepath      $statistics           = $opendkim::params::statistics,
  Boolean                   $send_reports         = $opendkim::params::send_reports,
  String                    $report_address       = $opendkim::params::report_address,
  String                    $software_header      = $opendkim::params::software_header,
  Optional[String]          $nameservers          = $opendkim::params::nameservers,
  Array[String]             $trusted_hosts        = $opendkim::params::trusted_hosts,
  String                    $mode                 = $opendkim::params::mode,
  String                    $canonicalization     = $opendkim::params::canonicalization,
  Array[String]             $domains              = $opendkim::params::domains,
  Boolean                   $use_selector         = $opendkim::params::use_selector,
  String                    $selector             = $opendkim::params::selector,
  Integer                   $minimum_key_bits     = $opendkim::params::minimum_key_bits,
  Boolean                   $use_keyfile          = $opendkim::params::use_keyfile,
  Stdlib::Absolutepath      $keyfile              = $opendkim::params::keyfile,
  String                    $removeoldsignatures  = $opendkim::params::removeoldsignatures,
  Optional[Integer]         $maximum_signed_bytes = $opendkim::params::maximum_signed_bytes,
  Optional[String]          $trustanchorfile      = $opendkim::params::trustanchorfile,
  String                    $querycache           = $opendkim::params::querycache,
  Boolean                   $manage_private_keys  = $opendkim::params::manage_private_keys,


  Array[Struct[{
    domain         => String,
    selector       => String,
    publickey      => String,
    privatekey     => String,
    signingdomains => Array[String],
  }]]                       $keys                 = $opendkim::params::keys,

  Enum['running','stopped'] $service_ensure       = $opendkim::params::service_ensure,
  Boolean                   $service_enable       = $opendkim::params::service_enable,
  String                    $service_name         = $opendkim::params::service_name,
) inherits opendkim::params {

  anchor { 'opendkim::begin': }
  -> class { '::opendkim::user': }
  -> class { '::opendkim::install': }
  -> class { '::opendkim::config': }
  ~> class { '::opendkim::service': }
  -> anchor { 'opendkim::end': }

}
