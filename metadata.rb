name             'artifactory'
maintainer       'Agile Orbit'
maintainer_email 'info@agileorbit.com'
license          'Apache V2'
description      'Installs/Configures artifactory'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

recipe 'artifactory::default', 'Installs Artifactory.'
recipe 'artifactory::apache-proxy', 'Setup Apache reverse proxy in front of Artifactory.'

depends          'java'
depends          'runit'
depends          'ark'
depends          'apache2'

supports 'ubuntu'
supports 'debian'
supports 'rhel'
