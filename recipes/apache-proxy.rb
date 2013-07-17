include_recipe "artifactory"
include_recipe "apache2"

template "#{node['apache']['dir']}/sites-available/artifactory" do
	source "apache-artifactory-vhost.conf.erb"
	mode "0644"
	notifies :reload, "service[apache2]"
end

apache_site "artifactory" do
	enable true
end
