#
# Cookbook Name:: artifactory
# Recipe:: install-unix
#
# Copyright (c) 2019 Patrick Schaumburg, Apache-2.0

# create user and group for artifactory
user node['artifactory']['user'] do
  home node['artifactory']['home']
  manage_home true
  action :create
end

group node['artifactory']['group'] do
  members [node['artifactory']['user']]
end

# tomcat things
directory node['artifactory']['catalina_base'] do
  owner node['artifactory']['user']
  group node['artifactory']['group']
  mode '0755'
  recursive true
end

%w(work temp).each do |tomcat_dir|
  directory ::File.join(node['artifactory']['catalina_base'], tomcat_dir) do
    owner node['artifactory']['user']
    group node['artifactory']['group']
    mode '0755'
  end
end

directory node['artifactory']['log_dir'] do
  owner node['artifactory']['user']
  group node['artifactory']['group']
  mode '0755'
end

ark 'artifactory' do
  url node['artifactory']['zip_url']
  checksum node['artifactory']['zip_checksum']
  owner node['artifactory']['user']
  group node['artifactory']['group']
  action :install
end

link node['artifactory']['home'] + '/webapps' do
  to '/usr/local/artifactory/webapps'
end

link node['artifactory']['catalina_base'] + '/logs' do
  to node['artifactory']['log_dir']
end

link node['artifactory']['catalina_base'] + '/conf' do
  to '/usr/local/artifactory/tomcat/conf'
end

template '/usr/local/artifactory/tomcat/conf/server.xml' do
  mode '0644'
  notifies :restart, 'runit_service[artifactory]'
end

runit_service 'artifactory'
