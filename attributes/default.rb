default["artifactory"]["zip_url"] = "http://dl.bintray.com/content/jfrog/artifactory/artifactory-3.0.1.zip?direct"
default["artifactory"]["zip_checksum"] = "ce7c087582c795c2cb4bccfdf2beb3034d5261db0ec3c280c859e9bf3d44b4d0"
default["artifactory"]["home"] = "/var/lib/artifactory"
default["artifactory"]["log_dir"] = "/var/log/artifactory"
default["artifactory"]["catalina_base"] = ::File.join(artifactory["home"], "tomcat")
default["artifactory"]["java"]["xmx"] = "1g"
default["artifactory"]["java"]["xms"] = "512m"
default["artifactory"]["java"]["extra_opts"] = "-XX:+UseG1GC"

default["artifactory"]["user"] = "artifactory"
default["artifactory"]["port"] = 8081
default["artifactory"]["shutdown_port"] = 8015