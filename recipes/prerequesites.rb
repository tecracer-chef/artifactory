#
# Cookbook:: artifactory
# Recipe:: prerequesites
#
# Copyright:: 2019 Patrick Schaumburg, Apache-2.0

include_recipe 'runit'
package 'unzip'
# ark requires rsync package
package 'rsync'
