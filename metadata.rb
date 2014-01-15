name             "artifactory"
maintainer       "Avishai Ish-Shalom"
maintainer_email "avishai@fewbytes.com"
license          "Apache V2"
description      "Installs/Configures artifactory"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.1"

depends          "java"
depends          "runit"
depends          "ark"
depends          "apache2"

supports "ubuntu"
supports "debian"
