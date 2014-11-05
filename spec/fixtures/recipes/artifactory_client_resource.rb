#encodeing: utf-8

artifactory_client 'Download artifact' do
  servername 'ArtServer'
  artifactname 'MyFile.zip'
  action :download
end

artifactory_client 'Download artifact with overwrite' do
  servername 'ArtServer'
  artifactname 'MyOverwriteFile.zip'
  overwrite True
  action :download
end

artifactory_client 'Download artifact with username' do
  servername 'ArtServer'
  artifactname 'MyUserFile.zip'
  username 'foo'
  password 'bar'
  action :download
end
