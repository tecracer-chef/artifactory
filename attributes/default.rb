default['artifactory']['version'] = '6.2.0'
default['artifactory']['home'] = '/var/lib/artifactory'
default['artifactory']['log_dir'] = '/var/log/artifactory'
default['artifactory']['catalina_base'] = ::File.join(node['artifactory']['home'], 'tomcat')
default['artifactory']['java']['xmx'] = '1g'
default['artifactory']['java']['xms'] = '512m'
default['artifactory']['java']['extra_opts'] = '-XX:+UseG1GC'

default['artifactory']['user'] = 'artifactory'
default['artifactory']['group'] = 'artifactory'
default['artifactory']['port'] = 8081
default['artifactory']['shutdown_port'] = 8015
default['artifactory']['install_java'] = true

default['artifactory']['use_ajp'] = false
default['artifactory']['ajp']['port'] = 8019
default['artifactory']['ajp']['maxThreads'] = 500
default['artifactory']['ajp']['minSpareThreads'] = 20
default['artifactory']['ajp']['enableLookups'] = false
default['artifactory']['ajp']['backlog'] = 100
