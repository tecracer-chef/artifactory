Artifactory Cookbook CHANGELOG
=======================

v0.4.0 - 2/24/2019
-------
- Update necessary informations after transferring ownership
- Update default recipe to set attribute based upon latest chef code
- Add java.jdk_version in attributes
- Add artifactory group in attributes
- Add ajp in attributes for apache-proxy recipe and template
- Change chef supermarket url in Berksfile
- Change download url in attributes
- Change catalina_base in attributes
- Fix linting errors in metadata.rb

v0.3.4 - 5/16/2017
-------
- Requires Java 8
- Updated artifactory version and checksum 5.2.1
- Updated test platforms
- Added AJP proxying default setings, cookbook loading, and template additions
- Minor typo and extraneous string interpolation cleanups
- Add ownership for directories
- Fix httpd config file name
- Add Travis CI builds

v0.3.1 - 2/3/2015
-------
- Updated Artifactory version to 3.3.1
- Change order so we actually get java opts
- Permissions fix

v0.3.0 - 9/19/2014
-------
- Update to Artifactory 3.1.1
- **[#1](https://github.com/agileorbit-cookbooks/artifactory/pull/1)** Minor Changes
 * ensure rsync is installed for ark
 * make directories recursively to support custom home dirs
 * make the home directory before the user resource, otherwise it will fail if home_dir doesn't exist
 * remove apt from .kitchen.yml because it's not depended in the metadata.

v0.2.0 - Initial release
-------
- Initial Release
