include Artifactory::Package

describe 'artifactory_package_resource' do
  let(:cookbook_paths) do
  	[
      File.expand_path("#{File.dirname(__FILE__)}/../../"),
      File.expand_path("#{File.dirname(__FILE__)}/")
  	]
  end

  let(:runner) do
    ChefSpec::Runner.new(
      :cookbook_path => cookbook_paths,
      :step_into => ['artifactory_package']
    )
  end

  let(:node) { runner.node }

  let(:chef_run) { runner.converge('fixtures::artifactory_package_resource') }
  
end