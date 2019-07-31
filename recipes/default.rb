#
# Cookbook:: artifactory
# Recipe:: default
#
# Copyright:: 2019 Patrick Schaumburg, Apache-2.0

case node['platform_family']
when 'windows'
  Chef::Application.fatal!('You want to install artifactory on windows, which is not supported right now.')
end

if node['artifactory']['install_java']
  node.default['java']['jdk_version'] = node['artifactory']['java']['jdk_version']
  node.default['java']['install_flavor'] = node['artifactory']['java']['install_flavor']
  include_recipe 'java'
end

include_recipe 'artifactory::prerequesites'
include_recipe "artifactory::install_#{node['artifactory']['install_flavor']}"
include_recipe 'artifactory::deprecations' # test this
