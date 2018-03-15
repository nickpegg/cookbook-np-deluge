#
# Cookbook Name:: np-deluge
# Recipe:: default

include_recipe 'apt'

include_recipe 'np-deluge::daemon' if node[:np_deluge][:enable_daemon]
include_recipe 'np-deluge::web' if node[:np_deluge][:enable_web]

package 'deluge-gtk' if node[:np_deluge][:enable_gui]
package 'deluge-console'
