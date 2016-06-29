#
# Cookbook Name:: package-builder
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'vim'

include_recipe 'apt'
include_recipe 'php'
include_recipe 'git'
include_recipe 'composer'

config = node['package-builder']

config['required_packages'].each do |requiredPackage|
	package requiredPackage do
		action :install
	end
end

config['required_gems'] do |requiredGem|
	gem_package requiredGem do
		action :install
	end
end

if config['local-stage']['setup-stage-container']
	include_recipe 'package-builder::stage-container'
end