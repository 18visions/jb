#
# Cookbook:: jumpbox
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.
execute 'yum update' do
    command 'sudo yum update -y'
  end
  
execute 'install_epel' do
  command 'sudo amazon-linux-extras install epel'
end

execute 'install_redis6' do
  command 'sudo amazon-linux-extras install redis6'
end

['htop','nano','stunnel','python3','gcc'].each do |p|
    package p do
      action :install
    end
  end

cookbook_file 'copy_stunnel.conf' do
  source 'files/stunnel.conf'
  path '/etc/stunnel/stunnel.conf'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
