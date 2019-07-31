# This file contains all possible attributes, which can be set
# artifactory configurations
default['artifactory']['home'] = '/var/lib/artifactory'
default['artifactory']['log_dir'] = '/var/log/artifactory'
default['artifactory']['user'] = 'artifactory'
default['artifactory']['group'] = 'artifactory'
default['artifactory']['port'] = 8081
# default['artifactory']['max_threads'] = 200
default['artifactory']['shutdown_port'] = 8015
default['artifactory']['install_java'] = true

# java configurations
default['artifactory']['catalina_base'] = ::File.join(node['artifactory']['home'], 'tomcat')
default['artifactory']['java']['xmx'] = '1g'
default['artifactory']['java']['xms'] = '512m'
default['artifactory']['java']['extra_opts'] = '-XX:+UseG1GC'
default['artifactory']['java']['jdk_version'] = 8
default['artifactory']['java']['install_flavor'] = 'adoptopenjdk'

# ajp configurations
default['artifactory']['use_ajp'] = false
default['artifactory']['ajp']['port'] = 8019
default['artifactory']['ajp']['maxThreads'] = 500
default['artifactory']['ajp']['minSpareThreads'] = 20
default['artifactory']['ajp']['enableLookups'] = false
default['artifactory']['ajp']['backlog'] = 100

# can be 'distribution' (apt source / yum source) || 'binary' (rpm / deb)
default['artifactory']['install_flavor'] = 'binary'
# when set install_flavor = distribution
default['artifactory']['edition'] = 'oss' # can be ce, oss, pro
default['artifactory']['version'] = '6.8.7'

# install_flavor = binary
default['artifactory']['package_uri'] = 'http://dl.bintray.com/jfrog/artifactory/jfrog-artifactory-oss-6.8.4.zip'
default['artifactory']['package_sha256'] = '4bbdb76cec091ba61b6d7bffc61b2432327f2e1375efb108468ee445cd5ed261'
