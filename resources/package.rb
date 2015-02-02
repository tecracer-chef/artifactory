#encoding: utf-8
#
# Cookbook Name:: artifactory
# Resource:: package
#

actions :download
default_action :download

attribute :protocol, kind_of: String, required: false, default: 'http'
attribute :servername, kind_of: String, required: true
attribute :port, kind_of: Integer, required: false, default: 8081
attribute :repository, kind_of: String, required: true
attribute :artifactpath, kind_of: String, required: false, default: ''
attribute :artifactname, kind_of: String, required: true
attribute :target_directory, kind_of: String, required: false, default: Chef::Config[:file_cache_path]
attribute :overwrite, kind_of: [TrueClass, FalseClass], required: false, default: false
attribute :username, kind_of: String, required: false
attribute :password, kind_of: String, required: false
