#
# Cookbook Name:: np-deluge
# Spec:: default
#
# The MIT License (MIT)
#
# Copyright (c) 2016 Nick Pegg
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'spec_helper'

describe 'np-deluge::default' do
  subject { memoized_runner(described_recipe) }

  context 'with default attributes' do
    it { is_expected.to include_recipe 'np-deluge::daemon' }
    it { is_expected.to include_recipe 'np-deluge::web' }

    it { is_expected.to install_package 'deluge-console' }
  end

  context 'with the GUI enabled' do
    before do
      subject.node.set[:np_deluge][:enable_gui] = true
      subject.converge described_recipe
    end

    it { is_expected.to install_package 'deluge-gtk' }
  end
end
