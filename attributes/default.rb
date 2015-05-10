default['yum']['rpmforge']['enabled'] = true
default['yum']['rpmforge']['exclude'] = 'perl-XML-SAX-Base'

default['yum']['rpmforge-extras']['enabled']  = false
default['yum']['rpmforge-extras']['managed']  = false

default['yum']['rpmforge-testing']['enabled'] = false
default['yum']['rpmforge-testing']['managed'] = false


if platform_family?('rhel') && node['platform_version'].to_f >= 7.0 
  default['man']['package']['name'] = 'man-db'
else
  default['man']['package']['name'] = 'man'
end
