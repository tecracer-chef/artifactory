#encoding: utf-8
#
# Cookbook Name:: artifactory
# Library:: package
#

require rest-client
require json

module Artifactory
	module Package
	  def download_package(protocol,
                           servername,
                           port,
                           repository,
                           artifactpath,
                           artifactname,
                           target_directory,
                           overwrite,
                           username,
                           password)

	  end
	end
end