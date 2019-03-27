describe.one do
  describe service('artifactory') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end

  describe runit_service('artifactory') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end
