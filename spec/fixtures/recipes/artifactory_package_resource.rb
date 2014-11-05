#encodeing: utf-8

artifactory_package 'Download artifact' do
  servername 'ArtServer'
  repository 'MyRepo'
  artifactname 'Download_artifact.exe'
end

artifactory_package 'Download artifact with overwrite' do
  servername 'ArtServer'
  repository 'MyRepo'
  artifactname 'Download_artifact_with_overwrite.exe'
  overwrite true
end

artifactory_package 'Download artifact with username' do
  servername 'ArtServer'
  repository 'MyRepo'
  artifactname 'Download_artifact_with_username.exe'
  username 'foo'
  password 'bar'
end
