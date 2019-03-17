# Artifactory Cookbook Changelog
This file is used to list changes made in each version of the artifactory cookbook.

## v1.0.0 - 17.03.2019

- Add installation type binary and distribution
- Add suites for testing
- Add some basic integration tests
- Add helpers for package detection
- Add Contributing.md
- Update server.xml template
- Prepared multi OS integration and moved recipe content of default into install_distribution
- Reorder attributes

## v0.5.0 - 05.03.2019

- Add kitchen dokken
- Add kitchen testing OS debian 9
- Add version pinning for cookbook dependencies
- Add integration tests through circle ci and dokken

## v0.4.1 - 05.03.2019

- Update changelog to new format
- Update readme with latest information and fix some typo

## v0.4.0 - 24.02.2019

- Update necessary informations after transferring ownership
- Update default recipe to set attribute based upon latest chef code
- Add java.jdk_version in attributes
- Add artifactory group in attributes
- Add ajp in attributes for apache-proxy recipe and template
- Change chef supermarket url in Berksfile
- Change download url in attributes
- Change catalina_base in attributes
- Fix linting errors in metadata.rb

## v0.3.4 - 16.05.2017

- Requires Java 8
- Updated artifactory version and checksum 5.2.1
- Updated test platforms
- Added AJP proxying default setings, cookbook loading, and template additions
- Minor typo and extraneous string interpolation cleanups
- Add ownership for directories
- Fix httpd config file name
- Add Travis CI builds

## v0.3.1 - 03.02.2015

- Updated Artifactory version to 3.3.1
- Change order so we actually get java opts
- Permissions fix

## v0.3.0 - 19.09.2014

- Update to Artifactory 3.1.1
- **[#1](https://github.com/agileorbit-cookbooks/artifactory/pull/1)** Minor Changes
 * ensure rsync is installed for ark
 * make directories recursively to support custom home dirs
 * make the home directory before the user resource, otherwise it will fail if home_dir doesn't exist
 * remove apt from .kitchen.yml because it's not depended in the metadata.

## v0.2.0

- Initial Release
