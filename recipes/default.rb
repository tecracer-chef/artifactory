#
# Cookbook Name:: artifactory
# Recipe:: default
#
# Copyright (C) 2013 Fewbytes
#
# Apache V2
#

# Build up URL using version string and get the java version
if Gem::Version.new(node['artifactory']['version']) > Gem::Version.new('3.9.5')
  node.set['artifactory']['zip_url'] = 'http://dl.bintray.com/content/jfrog/artifactory/jfrog-artifactory-oss-' +
                                   node['artifactory']['version'] + '.zip?direct'
  node.set['java']['jdk_version'] = 8
else
  node.set['artifactory']['zip_url'] = 'http://dl.bintray.com/content/jfrog/artifactory/artifactory-' +
                                   node['artifactory']['version'] + '.zip?direct'
  node.set['java']['jdk_version'] = 7
end


if node['artifactory']['install_java']
  include_recipe 'java'
end

include_recipe 'runit'
package 'unzip'
# ark requires rsync package
package 'rsync'


user node['artifactory']['user'] do
  home node['artifactory']['home']
end

group node['artifactory']['group'] do
  members [node['artifactory']['user']]
end


directory node['artifactory']['home'] do
  owner node['artifactory']['user']
  group node['artifactory']['group']
  mode 00755
  recursive true
end

directory node['artifactory']['catalina_base'] do
  owner node['artifactory']['user']
  group node['artifactory']['group']
  mode 00755
  recursive true
end

%w(work temp).each do |tomcat_dir|
  directory ::File.join(node['artifactory']['catalina_base'], tomcat_dir) do
    owner node['artifactory']['user']
    group node['artifactory']['group']
    mode 00755
  end
end

directory node['artifactory']['log_dir'] do
  owner node['artifactory']['user']
  group node['artifactory']['group']
  mode 00755
end

ark 'artifactory' do
  url node['artifactory']['zip_url']
  owner node['artifactory']['user']
  group node['artifactory']['group']
  action :install
end

link ::File.join(node['artifactory']['home'], 'webapps') do
  to '/usr/local/artifactory/webapps'
end

link ::File.join(node['artifactory']['catalina_base'], 'logs') do
  to node['artifactory']['log_dir']
end

link ::File.join(node['artifactory']['catalina_base'], 'conf') do
  to '/usr/local/artifactory/tomcat/conf'
end

template '/usr/local/artifactory/tomcat/conf/server.xml' do
  mode 00644
  notifies :restart, 'runit_service[artifactory]'
end

runit_service 'artifactory'
