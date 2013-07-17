include_recipe "artifactory"
include_recipe "apache2"

template "#{node['apache']['dir']}/sites-available/artifactory" do
	source "apache-artifactory-vhost.conf.erb"
	owner       'root'
	group       'root'
	mode        '0644'
	variables(
	:host_name        => host_name,
	:jenkins_port     => node['artifactory']['port']
	)
	
	if File.exists?("#{node['apache']['dir']}/sites-enabled/artifactory")
		notifies  :restart, 'service[apache2]'
	end
end

apache_site "artifactory" do
	enable true
end
