#
# Cookbook Name:: package-builder
# Recipe:: stage-container
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
apt_repository 'docker' do
	uri 'https://apt.dockerproject.org/repo'
	components ['main']
	distribution 'debian-jessie'
	key '58118E89F3A912897C070ADBF76221572C52609D'
    keyserver 'hkp://p80.pool.sks-keyservers.net:80'
end

package 'docker-engine'

docker_service 'default' do
	action [:create, :start]
end

directory node['package-builder']['local-stage']['directory'] do
	user node['package-builder']['local-stage']['user']
	action :create
end

directory "#{node['package-builder']['local-stage']['directory']}/environments" do
	user node['package-builder']['local-stage']['user']
	action :create
end

# see http://berkshelf.com
template "#{node['package-builder']['local-stage']['directory']}/Berksfile" do
	source 'Berksfile.erb'
end

# see https://docs.docker.com/engine/reference/builder/#run
template "#{node['package-builder']['local-stage']['directory']}/Dockerfile" do
	source 'Dockerfile.erb'
end

# see https://docs.chef.io/chef_solo.html
template "#{node['package-builder']['local-stage']['directory']}/node.json" do
	source 'node.json.erb'
end

# see https://docs.chef.io/config_rb_solo.html
template "#{node['package-builder']['local-stage']['directory']}/solo.rb" do
	source 'solo.rb.erb'
	variables({
		'env' => node['package-builder']['local-stage']['default-env']
	})
end

node['package-builder']['local-stage']['environments'].each do |env|
	template "#{node['package-builder']['local-stage']['directory']}/environments/#{env}.json" do
		source "#{env}.json.erb"
	end
end

docker_image 'piwik-stage' do
	tag 'latest'
	source "#{node['package-builder']['local-stage']['directory']}/Dockerfile"
	action :build
end

docker_container 'piwik-stage' do
	port '80:80'
	action [:create, :start]
end
