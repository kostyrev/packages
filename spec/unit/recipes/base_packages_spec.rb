#
# Cookbook Name:: packages
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'packages::base_packages' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'installs a bunch of packages' do
      expect(chef_run).to install_package('screen, bind-utils, telnet, mc, tree, lsof, yum-utils, sysstat, rsync, xfsprogs, file, openssh-clients, make, automake, boost-devel, rrdtool-perl, perl-libwww-perl, htop, bridge-utils, mailx, lynx, libssh2, crontabs, sysfsutils, sg3_utils, ncdu, policycoreutils-python, yum-plugin-changelog, iotop, strace, zip, psmisc, bash-completion, e2fsprogs')
    end

  end
end
