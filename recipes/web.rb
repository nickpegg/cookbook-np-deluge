#
# Cookbook Name:: np-deluge
# Recipe:: web

include_recipe 'np-deluge::daemon'

package 'deluge-web'

# Ensure these directories exist
directory '/var/log/deluged' do
  user 'debian-deluged'
end

# Install a service since the debian package doesn't include one
poise_service 'deluge-web' do
  action [:enable, :start]

  user 'debian-deluged'
  directory '/var/lib/deluged'
  command '/usr/bin/deluge-web -l /var/log/deluged/web.log -L info --ssl -c /var/lib/deluged/config'
end
