# artifactory cookbook
Installs JFrog's Artifactory.
Provides an LWRP for accessing artifacts.

# Requirements
* Java 7 (java cookbook)
* ark cookbook

# Usage
This cookbook doesn't configure Artifactory since Artifactory was designed primarily for configuration from the UI. It's possible to bootstrap Artifactory's configuration by copying an existing configuration to `$ARTIFACTORY_HOME/etc/artifactory.config.import.xml`. A configuration file can be obtained from a running Artifactory server using curl:

	curl -u admin:password -X GET -H 'Accept: application/xml' http://localhost:8081/artifactory/api/system/configuration

Refer to [Artifactory user guide](http://wiki.jfrog.org/confluence/display/RTF/Global+Configuration+Descriptor) for more details

The default username/password for the server is admin/password

# Attributes
* `node['artifactory']['home']` - Artifactory home directory. Artifacts are kept here
* `node['artifactory']['log_dir']` - Artifactory/tomcat logs
* `node['artifactory']['port']` - Artifactory http port, default is 8081
* `node['artifactory']['shutdown_port']` - Artifactory http port, default is 8081
* `node['artifactory']['java']['xmx']` - java Xmx (max heap size)
* `node['artifactory']['java']['xms']` - java Xms (initial heap size)
* `node['artifactory']['java']['extra_opts']` - Extra java options, default is '-XX:+UseG1GC'
* `node['artifactory']['install_java']` - Instruct this cookbook to install Java for you. Default `true`


# Recipes
* artifactory::default - Installs Artifactory
* artifactory::apache-proxy - Setup Apache reverse proxy in front of Artifactory

Resources/Providers
===================

The package resource/provider allows generic downloads of artifacts from an artifactory server via rest api calls.

artifactory_package
----------------

### Actions
- :download: Download an artifact

### Parameters 
- protocol, String, default: 'http'
- servername, String, **required**
- port, Integer, default: 8081
- repository, String, **required**
- artifactpath, String, default: ''
- artifactname, String, **required**
- target_directory, String, default: Chef::Config[:file_cache_path]
- overwrite, [TrueClass, FalseClass], default: false
- username, String
- password, String

### Example

The below example retrieves the artifact's downloadUri and sha1 checksum from https://artserver.example.com:8081/artifactory/api/storage/myrepo-local/x/y/z/foo.

It then downloads the artifact locally to the /a/b/c target directory.  

Additionally, as overwrite is set to true, it will perform the download even if the file already exists in the target directory.  Otherwise the artifact is only downloaded if it does not already exist or if the sha1 checksum of the local artifact does not match the server provided sha1 value.  

```
artifactory_package 'Download artifact with overwrite' do
  protocol 'https'
  servername 'artserver.example.com'
  port 8081
  repository 'myrepo-local'
  artifactpath 'x/y/z/' # note trailing slash 
  artifactname 'foo'
  target_directory '/a/b/c'
  overwrite true
  username 'artuser'
  password 'plaintxtisNotaG00didea' 
  action :download
end
```

# Author

* Author:: Avishai Ish-Shalom (<avishai@fewbytes.com>)
* Author:: Eric Helgeson (<erichelgeson@gmail.com>)
* Author:: Shawn Weitzel (<sweitzel74@gmail.com>)
* Author:: Heath Snow (<heathsnow@gmail.com>)
