#
# Cookbook Name:: artifactory
# Recipe:: source-uri
#
# Copyright (c) 2019 Patrick Schaumburg, Apache-2.0

# this will be deprecated within the next versions
node.default['artifactory']['package_url'] = node['artifactory']['package_url'] || node['artifactory']['zip_url']
node.default['artifactory']['package_sha256'] = node['artifactory']['package_sha256'] || node['artifactory']['zip_checksum']

case file_ending
when '.zip'
  log 'detected zip file'

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

  # logging directory
  directory node['artifactory']['log_dir'] do
    owner node['artifactory']['user']
    group node['artifactory']['group']
    mode '0755'
  end

  # ark downloads, unzips, creates service configs etc. (too much)
  ark 'artifactory' do
    url node['artifactory']['package_uri']
    checksum node['artifactory']['package_checksum']
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

when '.deb'
  log 'detected debian package'

  remote_file binary_file do
    source node['artifactory']['package_uri']
    checksum node['artifactory']['package_sha256']
  end

  dpkg_package 'artifactory' do
    source binary_file
    action :upgrade
  end

  service 'artifactory' do
    action [:start, :enable]
    retries 2
  end

when '.rpm'
  log 'detected rpm package'

  remote_file binary_file do
    source node['artifactory']['package_uri']
    checksum node['artifactory']['package_sha256']
  end

  rpm_package 'artifactory' do
    source binary_file
    action :upgrade
  end

  service 'artifactory' do
    action [:start, :enable]
    retries 2
  end

else
  Chef::Application.fatal!('You are using a non supported binary! Only .zip, .deb or .rpm are supported right now')
end
