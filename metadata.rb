name             'artifactory'
maintainer       'Patrick Schaumburg'
maintainer_email 'info@p-schaumburg.de'
license          'Apache-2.0'
description      'Installs/Configures artifactory'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.1'

source_url 'https://github.com/pschaumburg/artifactory' if defined?(:source_url)
issues_url 'https://github.com/pschaumburg/artifactory/issues' if defined?(:issues_url)

chef_version '>= 12.1' if respond_to?(:chef_version)

recipe 'artifactory::default', 'Installs Artifactory.'
recipe 'artifactory::apache-proxy', 'Setup Apache reverse proxy in front of Artifactory.'

depends 'java', '~> 3.2.1'
depends 'runit', '~> 4.0.1'
depends 'ark', '~> 3.0.0'
depends 'apache2', '~> 5.0.0'

supports 'ubuntu'
supports 'debian'
supports 'redhat'
