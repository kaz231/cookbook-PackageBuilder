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

package 'php5-curl' do
	action :install
end

if node['package-builder']['local-stage']['setup-stage-container']
	include_recipe 'package-builder::stage-container'
end