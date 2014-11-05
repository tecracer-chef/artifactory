#encoding: utf-8
#
# Cookbook Name:: artifactory
# Provider:: package
#
include Artifactory::Package

action :download do
  d = download_package(
    @new_resource.protocol,
    @new_resource.servername,
    @new_resource.port,
    @new_resource.repository,
    @new_resource.artifactpath,
    @new_resource.artifactname,
    @new_resource.target_directory,
    @new_resource.overwrite,
    @new_resource.username,
    @new_resource.password
  )
  new_resource.updated_by_last_action(d)
end