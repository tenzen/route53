#
# Cookbook Name:: route53
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


node.normal['build_essential']['compiletime'] = true
include_recipe 'build-essential'

fog_version = "1.10.1"
if !Gem::Specification.find_all_by_name("fog", fog_version).any?

	ENV['NOKOGIRI_USE_SYSTEM_LIBRARIES'] = 'true'
	include_recipe "xml::ruby" # XXX includes nokogiri

	chef_gem "fog" do
	  action :install
	  version fog_version
	end

end
