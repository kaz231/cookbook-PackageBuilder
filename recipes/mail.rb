#
# Cookbook Name:: package-builder
# Recipe:: mail
#
# Copyright (C) 2016 Kamil Zajac
#
# All rights reserved - Do Not Redistribute
#
config = node['package-builder']['mail']

template '/etc/exim4/update-exim4.conf.conf' do
	source 'exim4.conf.erb'
	user 'root'
	group 'root'
	variables({
		'other_hostnames' => config['other_hostnames'],
		'local_interfaces' => config['local_interfaces'],
		'relay_domains' => config['local_interfaces']
	})
end

service 'exim4' do
	action :restart
end