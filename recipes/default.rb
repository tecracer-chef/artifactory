#
# Cookbook Name:: artifactory
# Recipe:: default
#
# Copyright (c) 2019 Patrick Schaumburg, Apache-2.0

node.default['artifactory']['package_url'] = node['artifactory']['zip_url']
node.default['artifactory']['package_sha256'] = node['artifactory']['zip_checksum']

if node['artifactory']['install_java']
  node.default['java']['jdk_version'] = node['artifactory']['java']['jdk_version']
  include_recipe 'java'
end

include_recipe 'artifactory::prerequesites'

case node['platform']
when 'ubuntu', 'centos', 'redhat', 'amazon'
  include_recipe "artifactory::source-#{node['artifactory']['install_flavor']}"
  include_recipe 'artifactory::install-unix'

when 'windows'
  include_recipe 'artifactory::install-windows'

end

include_recipe 'artifactory::deprecations'
