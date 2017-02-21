node 'vagrant-ubuntu-trusty-64' {
  class { 'apache':                # use the "apache" module
    default_vhost => false,        # don't use the default vhost
    default_mods => false,         # don't load default mods
    mpm_module => 'prefork',        # use the "prefork" mpm_module
  }
   include apache::mod::php
   apache::vhost { 'mkd.vn':
    port    => '80',
    docroot => '/var/www',     
  }
  
  class { 'apache::mod::alias': }
  class { 'apache::mod::rewrite': }  
 include php
  
	  
	 php::fpm: false
}