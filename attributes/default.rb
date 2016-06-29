# PHP
default['php']['version'] = '5.6.20'
default['php']['install_method'] = 'package'
default['php']['directives'] = {
	"date.timezone" => 'Europe/Warsaw',
	"always_populate_raw_post_data" => -1
}
#default['php']['package_options'] = '--force-yes'

# PACKAGE-BUILDER
default['package-builder']['local-stage'] = {
	'setup-stage-container' => false,
	'docker-image' => nil,
	'environments' => ['dev'],
	'directory' => '/home/vagrant/piwik-stage',
	'default-env' => 'dev',
	'user' => 'vagrant',
	'ip' => '192.168.16.40'
}

default['package-builder']['required_packages'] = %w(
	php5-curl
)

default['package-builder']['required_gems'] = %w(
	travis
)