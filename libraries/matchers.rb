#encoding: utf-8
#
# Cookbook Name:: artifactory
# Library:: matchers
#
if defined?(ChefSpec)
  ChefSpec::Runner.define_runner_method :artifactory_package

  def download_artifactory_package(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:artifactory_package, :download, resource_name)
  end
end