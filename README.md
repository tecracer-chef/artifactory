# artifactory cookbook
Installs JFrog's Open Source Artifactory

# Requirements
* Java 8 (java cookbook) for Artifactory versions 4.0.0 and above or
  Java 7 for versions below that
* ark cookbook

# Usage
This cookbook doesn't configure Artifactory since Artifactory was designed primarily for configuration from the UI. It's possible to bootstrap Artifactory's configuration by copying an existing configuration to `$ARTIFACTORY_HOME/etc/artifactory.config.import.xml`. A configuration file can be obtained from a running Artifactory server using curl:

	curl -u admin:password -X GET -H 'Accept: application/xml' http://localhost:8081/artifactory/api/system/configuration

Refer to [Artifactory user guide](http://wiki.jfrog.org/confluence/display/RTF/Global+Configuration+Descriptor) for more details

The default username/password for the server is admin/password

# Attributes
* `node['artifactory']['version']` - Version number to install, string like '6.2.0'
* `node['artifactory']['home']` - Artifactory home directory. Artifacts are kept here
* `node['artifactory']['log_dir']` - Artifactory/tomcat logs
* `node['artifactory']['port']` - Artifactory http port, default is 8081
* `node['artifactory']['shutdown_port']` - Artifactory http shutdown port, default is 8015
* `node['artifactory']['java']['xmx']` - java Xmx (max heap size)
* `node['artifactory']['java']['xms']` - java Xms (initial heap size)
* `node['artifactory']['java']['extra_opts']` - Extra java options, default is '-XX:+UseG1GC'
* `node['artifactory']['install_java']` - Instruct this cookbook to install Java for you. Default `true`
* `node['artifactory']['use_ajp']` - Instruct this cookbook to install AJP proxy for you. Default `false`
* `node['artifactory']['ajp']['port']` -Port to use for AJP. Default 8019
* `node['artifactory']['ajp']['maxThreads']` - Maximum number of AJP threads. Default 500
* `node['artifactory']['ajp']['minSpareThreads']` - Number of reserved threads. Default 20
* `node['artifactory']['ajp']['enableLookups']` - Whether to do DNS lookups (performance hit) Default false
* `node['artifactory']['ajp']['backlog']` - Maximum amounty of requests to queue when all threads are in use. Default 100



# Recipes
* artifactory::default - Installs Artifactory
* artifactory::apache-proxy - Setup Apache reverse proxy in front of Artifactory

# Author

* Author:: Avishai Ish-Shalom (<avishai@fewbytes.com>)
* Author:: Eric Helgeson (<erichelgeson@gmail.com>)
* Author:: Ronald Chmara (<ronabop@gmail.com>)
