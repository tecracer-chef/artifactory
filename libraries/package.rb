# encoding: utf-8
#
# Cookbook Name:: artifactory
# Library:: package
#

require 'rest-client'
require 'json'
require 'open-uri'
require 'digest/sha1'

module Artifactory
  # package module for downloading artifact's from Artifactory
  module Package
    def download_package(params = {})
      download_path = File.join(params[:target_directory], \
                                params[:artifactname])
      json_metadata = get_metadata(params)
      artifact_sha1 = json_metadata['checksums']['sha1']
      download_uri = json_metadata['downloadUri']
      download_req = true if params[:overwrite] || \
        !File.exist?("#{download_path}") || \
        !sha_equal?(download_path, artifact_sha1)
      download_artifact(download_path, download_uri, artifact_sha1, params) \
      if download_req
    end

    def get_metadata(params)
      server_metadata_url = build_server_metadata_url(params)
      resp = RestClient::Request.new(method: 'get',
                                     url: server_metadata_url,
                                     user: params[:username],
                                     password: params[:password]).execute
      JSON.parse(resp)
    end

    def build_server_metadata_url(params)
      metadata_url = \
        if port
          "#{params[:protocol]}://#{params[:servername]}:#{params[:port]}"
        else
          "#{params[:protocol]}://#{params[:servername]}"
        end
      "#{metadata_url}/artifactory/api/storage/" \
      "#{params[:repository]}/#{params[:artifactpath]}#{params[:artifactname]}"
    end

    def download_artifact(download_path, download_uri, artifact_sha1, params)
      Chef::Log.info "Downloading artifact to: #{download_path}"
      File.open(download_path, 'wb') do |file|
        if params[:username] && params[:password]
          file.write open(download_uri, \
                          http_basic_authentication: [params[:username], \
                                                      params[:password]]).read
        else
          file.write open(download_uri).read
        end
      end
      fail 'The hash of downloaded artifact does not match serverside values' \
      unless sha_equal?(download_path, artifact_sha1)
    end

    def sha_equal?(download_path, artifact_sha1)
      Chef::Log.info "Checking sha1 of #{download_path}"
      dl_sha = Digest::SHA1.file(download_path).hexdigest
      if dl_sha != artifact_sha1
        Chef::Log.warn "The SHA1 value of the downloaded artifact:\n#{dl_sha}\n"
        Chef::Log.warn "doesn't match the Artifactory server:\n#{artifact_sha1}"
        return false
      else
        Chef::Log.info 'Sha1 matches!'
        return true
      end
    end
  end
end
