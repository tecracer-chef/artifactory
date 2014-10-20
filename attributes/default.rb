default['artifactory']['zip_url'] = 'http://dl.bintray.com/content/jfrog/artifactory/artifactory-3.4.0.zip?direct'
default['artifactory']['zip_checksum'] = 'fc5ce44abd5c9a019d44d6848316a0c50bd59a14e52655397eeb3678c35bf9cf'
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
