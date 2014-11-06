default['artifactory']['zip_url'] = 'http://dl.bintray.com/content/jfrog/artifactory/artifactory-3.4.1.zip?direct'
default['artifactory']['zip_checksum'] = '5019e4a4cac7936b3d4e1fc457d36fff60cdf27de42886184b0b5a844f43f0b0'
default['artifactory']['home'] = '/var/lib/artifactory'
default['artifactory']['log_dir'] = '/var/log/artifactory'
default['artifactory']['catalina_base'] = ::File.join(artifactory['home'], 'tomcat')
default['artifactory']['java']['xmx'] = '1g'
default['artifactory']['java']['xms'] = '512m'
default['artifactory']['java']['extra_opts'] = '-XX:+UseG1GC'

default['artifactory']['user'] = 'artifactory'
default['artifactory']['port'] = 8081
default['artifactory']['shutdown_port'] = 8015
default['artifactory']['install_java'] = true
