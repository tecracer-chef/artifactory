# encoding: utf-8
#
# Cookbook Name:: artifactory
# Provider:: package
#
include Artifactory::Package

action :download do
  d = download_package(
    protocol: @new_resource.protocol,
    servername: @new_resource.servername,
    port: @new_resource.port,
    repository: @new_resource.repository,
    artifactpath: @new_resource.artifactpath,
    artifactname: @new_resource.artifactname,
    target_directory: @new_resource.target_directory,
    overwrite: @new_resource.overwrite,
    username: @new_resource.username,
    password: @new_resource.password
  )
  new_resource.updated_by_last_action(d)
end
