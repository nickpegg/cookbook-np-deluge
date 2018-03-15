require 'spec_helper'

describe 'np-deluge::web' do
  describe file('/usr/bin/deluge-web') do
    it { is_expected.to be_executable }
  end

  describe service 'deluge-web' do
    it { is_expected.to be_running }
  end

  describe process 'deluge-web' do
    it { is_expected.to be_running }
    its(:user) { is_expected.to eq 'debian-deluged' }
  end

  describe port 8112 do
    it { is_expected.to be_listening.on('0.0.0.0').with('tcp') }
  end
end
