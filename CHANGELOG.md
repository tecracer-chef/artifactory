Artifactory Cookbook CHANGELOG
=======================

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
- Initial Releas
