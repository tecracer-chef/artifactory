control 'package-oss' do
  impact 0.7
  title 'Verify artifactory install'
  desc 'Ensures artifactory is installed'
  describe package('jfrog-artifactory-pro') do
    it { should be_installed }
    its('version') { should eq '6.8.7' }
  end
end
