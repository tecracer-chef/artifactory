#
# Cookbook Name:: artifactory
# Recipe:: source-distribution
#
# Copyright (c) 2019 Patrick Schaumburg, Apache-2.0

case node['artifactory']['edition']
when 'oss', 'ce'
  apt_repository 'jfrog_source_ceoss' do
    uri 'https://jfrog.bintray.com/artifactory-debs'
    key 'https://bintray.com/user/downloadSubjectPublicKey?username=jfrog'
    components ['main']
  end
when 'pro'
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
