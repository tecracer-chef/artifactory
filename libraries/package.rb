#encoding: utf-8
#
# Cookbook Name:: artifactory
# Library:: package
#

require 'rest-client'
require 'json'
require 'open-uri'

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
      begin 
        json_metadata = get_metadata(protocol,
                                     servername,
                                     port,
                                     repository,
                                     artifactpath,
                                     artifactname,
                                     username,
                                     password)
        artifact_sha1 = json_metadata['checksums']['sha1']
        download_uri = json_metadata['downloadUri']

#        if overwrite == true || \
#           !local_artifact_exists?(target_directory, artifactname) || \
#           existing_artifact.sha1 != artifact_sha1
          download_artifact(target_directory,
                            artifactname,
                            download_uri,
                            username,
                            password,
                            artifact_sha1)
#        end
      end
    end

    def get_metadata(protocol,
                     servername,
                     port,
                     repository,
                     artifactpath,
                     artifactname,
                     username,
                     password)
      server_metadata_url = build_server_metadata_url(protocol, 
                                                      servername,
                                                      port,
                                                      repository,
                                                      artifactname,
                                                      artifactpath)
      return RestClient::Request.new(method: get,
                                     url: server_metadata_url,
                                     user: username,
                                     password: password).execute()                                     
    end

    def build_server_metadata_url(protocol, 
                                  servername, 
                                  port, 
                                  repository, 
                                  artifactname, 
                                  artifactpath)
      metadata_url = "#{protocol}://"

      if port
        metadata_url = "#{metadata_url}#{servername}:#{port}"
      else
        metadata_url = "#{metadata_url}#{servername}"
      end
      return "#{metadata_url}/artifactory/api/storage/" \
             "#{repository}/#{artifactpath}#{artifactname}"     
    end

    def download_artifact(target_directory,
                          artifactname, 
                          download_uri,
                          username,
                          password,
                          artifact_sha1)
      if username || password
        open("#{target_directory}#{artifactname}",'w').write(
          open(download_uri,
               http_basic_authentication: [username, password]).read)
      else
        open("#{target_directory}#{artifactname}",'w').write(
          open(download_uri).read)
      end
    end
  end
end