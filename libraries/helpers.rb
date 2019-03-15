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
    end
  end
end

Chef::Recipe.include(Artifactory::Cookbook::Helpers)
