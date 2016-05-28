#
# Cookbook Name:: np-deluge
# Recipe:: daemon

package 'deluged'

cookbook_file '/etc/default/deluged' do
  source 'etc-default'

  # Debian workaround, it thinks the daemon is already running even if it's not enabled
  # via /etc/default/deluged
  notifies :restart, 'service[deluged]' if node['platform'] == 'debian'
end

service 'deluged' do
  action :start
end
