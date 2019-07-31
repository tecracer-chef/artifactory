#
# Cookbook:: artifactory
# Recipe:: install_distribution
#
# Copyright:: 2019 Patrick Schaumburg, Apache-2.0

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
    retries 2
    retry_delay 10
  end

when 'rhel', 'centos', 'amazon'
  case node['artifactory']['edition']
  when 'oss', 'ce'
    # editions OSS + CE
    yum_repository 'jfrog_source_ceoss' do
      baseurl 'https://jfrog.bintray.com/artifactory-rpms'
      gpgkey 'https://bintray.com/user/downloadSubjectPublicKey?username=jfrog'
      gpgcheck true
    end
  when 'pro'
    # editions Pro
    yum_repository 'jfrog_source_pro' do
      baseurl 'https://jfrog.bintray.com/artifactory-pro-rpms'
      gpgkey 'https://bintray.com/user/downloadSubjectPublicKey?username=jfrog'
      gpgcheck true
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
    retries 2
    retry_delay 10
  end

when 'windows'
  Chef::Application.fatal!('You want to install artifactory on windows, which is not supported right now.')

end
