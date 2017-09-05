include apache

class { 'apache': 
	default_vhost => false,
}

apache::vhost { 'mkd.vn':
	  port    => '80',
	  docroot => '/var/www',
	}