default['artifactory']['zip_url'] = 'http://dl.bintray.com/content/jfrog/artifactory/artifactory-3.3.1.zip?direct'
default['artifactory']['zip_checksum'] = '4ed51d1512a49d87f87d7f2dcd72384bce7f1fd495ff550290348c9671f046c9'
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
