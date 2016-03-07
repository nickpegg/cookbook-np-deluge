require 'spec_helper'

describe 'np-deluge::daemon' do
  describe file('/usr/bin/deluged') do
    it { is_expected.to be_executable }
  end

  describe service 'deluged' do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe process 'deluged' do
    it { is_expected.to be_running }
    its(:user) { should eq 'debian-deluged' }
  end

  describe port 58_846 do
    it { is_expected.to be_listening.on('127.0.0.1').with('tcp') }
  end
end
