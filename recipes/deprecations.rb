#
# Cookbook:: artifactory
# Recipe:: deprecations
#
# Copyright:: 2019 Patrick Schaumburg, Apache-2.0

# log "you are using the attribute node['artifactory']['zip_url'], which will be deprecated in future versions" do
#   level :warn
#   only_if node['artifactory']['zip_url']
# end
#
# log "you are using the attribute node['artifactory']['zip_checksum'], which will be deprecated in future versions" do
#   message "use node['artifactory']['package_checksum'] instead"
#   level :warn
#   only_if node['artifactory']['zip_checksum']
# end
