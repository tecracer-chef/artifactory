control 'package-oss' do
  impact 0.7
  title 'Verify artifactory install'
  desc 'Ensures artifactory is installed'
  if os.family == 'debian'
    describe package('jfrog-artifactory-cpp-ce') do
      it { should be_installed }
      its('version') { should eq '6.8.7' }
    end
  elsif os.family == 'redhat'
    describe package('jfrog-artifactory-cpp-ce') do
      it { should be_installed }
      its('version') { should eq '6.8.7-60807900' }
    end
  end
end
