#
# Cookbook Name:: artifactory
# Recipe:: source-distribution
#
# Copyright (c) 2019 Patrick Schaumburg, Apache-2.0

case node['platform_family']
when 'debian', 'ubuntu'
  case node['artifactory']['edition']
  when 'oss', 'ce'
    # editions OSS + CE
    apt_repository 'jfrog_source_ceoss' do
      uri 'https://jfrog.bintray.com/artifactory-debs'
      key 'https://bintray.com/user/downloadSubjectPublicKey?username=jfrog'
      components ['main']
    end
  when 'pro'
    # editions Pro
    apt_repository 'jfrog_source_pro' do
      uri 'https://jfrog.bintray.com/artifactory-pro-debs'
      key 'https://bintray.com/user/downloadSubjectPublicKey?username=jfrog'
      components ['main']
    end
  else
    log 'no supported version given' do
      level :fatal
    end
  end

  package pack_name do
    version node['artifactory']['version']
  end

  service 'artifactory' do
    action [:start, :enable]
  end

when 'rhel', 'centos', 'amazon'
  case node['artifactory']['edition']
  when 'oss', 'ce'
    # editions OSS + CE
    yum_repository 'jfrog_source_ceoss' do
      baseurl 'https://bintray.com/jfrog/artifactory-pro-rpms/rpm'
      gpgkey 'https://bintray.com/user/downloadSubjectPublicKey?username=jfrog'
    end
  when 'pro'
    # editions Pro
    yum_repository 'jfrog_source_pro' do
      baseurl 'https://bintray.com/jfrog/artifactory-pro-rpms/rpm'
      gpgkey 'https://bintray.com/user/downloadSubjectPublicKey?username=jfrog'
    end
  else
    log 'no supported version given' do
      level :fatal
    end
  end

when 'windows'
  Chef::Application.fatal!('You want to install artifactory on windows, which is not supported right now.')

end
