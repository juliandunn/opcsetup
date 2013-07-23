#
# Cookbook Name:: opcsetup
# Recipe:: default
#
# Copyright (C) 2013 Opscode, Inc.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "ntp"

service "ntpd" do
  action [:enable, :start]
  only_if { ['redhat'].include?(node['platform_family']) }
end

case node['platform_family']
when 'redhat'
  %w{crontabs git freetype libpng}.each do |pkg|
    package pkg
  end

  service "qpidd" do
    action [:stop, :disable]
    ignore_failure true
  end

  package "qpid-cpp-server" do
    action :remove
  end

when 'debian', 'ubuntu'
  package 'git-core'

end
