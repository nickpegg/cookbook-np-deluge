require 'spec_helper'

describe 'np-deluge::web' do
  subject { memoized_runner(described_recipe) }

  it { is_expected.to create_directory('/var/log/deluged').with(user: 'debian-deluged') }
  it { is_expected.to enable_poise_service 'deluge-web' }
  it { is_expected.to start_poise_service 'deluge-web' }
end
