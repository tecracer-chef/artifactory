default['artifactory']['zip_url'] = 'http://dl.bintray.com/content/jfrog/artifactory/jfrog-artifactory-oss-5.2.1.zip'
default['artifactory']['zip_checksum'] = '993d9abd188a6b1eaf4c762f201f0ba70f545ca68ad099f9a9a48bec3470d68d'
default['artifactory']['home'] = '/var/lib/artifactory'
default['artifactory']['log_dir'] = '/var/log/artifactory'
default['artifactory']['catalina_base'] = ::File.join(artifactory['home'], 'tomcat')
default['artifactory']['java']['xmx'] = '1g'
default['artifactory']['java']['xms'] = '512m'
default['artifactory']['java']['extra_opts'] = '-XX:+UseG1GC'
default['artifactory']['java']['jdk_version'] = 8

default['artifactory']['user'] = 'artifactory'
default['artifactory']['port'] = 8081
default['artifactory']['shutdown_port'] = 8015
default['artifactory']['install_java'] = true
