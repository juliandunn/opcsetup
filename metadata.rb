name             'opcsetup'
maintainer       'Opscode, Inc.'
maintainer_email 'jdunn@opscode.com'
license          'Apache 2.0'
description      'Configures a machine to have necessary pre-requisites for installing Opscode Private Chef'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{redhat centos ubuntu}.each do |p|
  supports p
end
