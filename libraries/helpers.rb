module Artifactory
  module Cookbook
    module Helpers
      def file_ending
        package = node['artifactory']['package_uri']
        File.extname(package)
      end

      def pack_name
        case node['artifactory']['edition']
        when 'oss'
          'jfrog-artifactory-oss'
        when 'ce'
          'jfrog-artifactory-cpp-ce'
        when 'pro'
          'jfrog-artifactory-pro'
        end
      end

      def binary_file
        Chef::Config[:file_cache_path] + '/artifactory' + file_ending
      end
    end
  end
end

Chef::Recipe.include(Artifactory::Cookbook::Helpers)
Chef::Resource.include(Artifactory::Cookbook::Helpers)
