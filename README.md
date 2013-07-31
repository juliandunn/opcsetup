Opscode Private Chef Server 1.x Setup Cookbook
==============================================

The default recipe in this cookbook accomplishes the pre-requisites in the documentation page: http://docs.opscode.com/server/private_chef_1x_install.html

Requirements
------------

Either a RHEL or Ubuntu OS that's supported by Opscode.

Usage
-----

You probably want to just run this in chef-solo mode once, but of course it doesn't hurt to put it in the run_list of the OPC server if you're running chef-client on that as well.

Attributes
----------

None.

Recipes
-------

default recipe sets up the system per the above.

If you want real SSL certificates, create the `/etc/opscode/private-chef.rb` file if it doesn't exist already and include something like the following:

  nginx['ssl_certificate']  = "/etc/opscode/ssl/chefserver.cert"
  nginx['ssl_certificate_key']  = "/etc/opscode/ssl/chefserver.key"

Then run `private-chef-ctl reconfigure`.

License and Author
------------------

Author:: Julian C. Dunn (<jdunn@opscode.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
