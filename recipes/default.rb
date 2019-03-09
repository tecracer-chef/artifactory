#
# Cookbook Name:: artifactory
# Recipe:: default
#
# Copyright (c) 2019 Patrick Schaumburg, Apache-2.0

case node['platform']
when 'ubuntu', 'centos', 'redhat', 'amazon'
  include_recipe 'artifactory::install-unix'

when 'windows'
  include_recipe 'artifactory::install-windows'

end
