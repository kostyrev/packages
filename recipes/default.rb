#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright (c) 2015 Aleksanr Kostyrev, No Rights Reserved.

if platform_family?('rhel')
  include_recipe 'yum-repoforge'
end

include_recipe 'packages::base_packages'



