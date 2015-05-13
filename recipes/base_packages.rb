#
# Cookbook Name:: packages
# Recipe:: packages
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package %w(
  screen
  bind-utils
  telnet
  mc
  tree
  lsof
  yum-utils
  sysstat
  rsync
  xfsprogs
  file
  openssh-clients
  make
  automake
  boost-devel
  rrdtool-perl
  perl-libwww-perl
  htop
  bridge-utils
  mailx
  lynx
  libssh2
  crontabs
  sysfsutils
  sg3_utils
  ncdu
  policycoreutils-python
  yum-plugin-changelog
  iotop
  strace
  zip
  psmisc
  bash-completion
  e2fsprogs
) do
  action :install
end

package %w(
    re2c
    ruby-json
    echoping
  ) do
    action :install
    only_if { platform_family?('rhel') && node['platform_version'].to_i >= 6 && node['platform_version'].to_i < 7 }
end

package node['man']['package']['name'] do
  action :install
end

package 'glibc' do
  action :upgrade
  only_if { platform_family?('rhel') }
end

package %w(
  openssl
  bash
) do
  action :upgrade
end

execute 'reload apache2' do
  command 'apachectl graceful'
  action :nothing
  only_if { ::File.exist?('/usr/sbin/httpd') }
end

package %w(
  tzdata-java
  tzdata
) do
  action :upgrade
  notifies :run, 'execute[reload apache2]', :immediately
end
