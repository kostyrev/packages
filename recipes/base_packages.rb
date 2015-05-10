#
# Cookbook Name:: packages
# Recipe:: packages
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package %w{
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
} do
    action :install
end

if platform_family?('rhel') && node['platform_version'].to_i >= 6 && node['platform_version'].to_i < 7
  package %w{
    re2c
    ruby-json
    echoping
  } do
      action :install
    end
end

package "#{node['man']['package']['name']}" do
  action :install
end

package %w{
  openssl
  bash
  glibc
} do
    action :upgrade
end

execute "reload apache2" do
  command "apachectl graceful"
  action :nothing
end

package %w{
  tzdata-java
  tzdata
} do
    action :upgrade
    notifies :run, 'execute[reload apache2]', :immediately
    only_if do ::File.exists?('/usr/sbin/httpd') end
end
