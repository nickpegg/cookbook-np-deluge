require 'spec_helper'

describe 'np-deluge::daemon' do
  let(:chef_run) { memoized_runner(described_recipe) }
  subject { chef_run }

  it { is_expected.to install_package 'deluged' }
  it do
    is_expected.to create_cookbook_file('/etc/default/deluged').with(
      source: 'etc-default'
    )
  end

  it { is_expected.to start_service 'deluged' }

  context 'on Debian' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'debian', version: '8.2').converge(described_recipe)
    end

    subject { chef_run.cookbook_file('/etc/default/deluged') }

    it { is_expected.to notify('service[deluged]').to(:restart) }
  end
end
