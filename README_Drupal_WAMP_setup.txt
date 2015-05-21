
*********************************************************************
(1) Windows hosts file
C:\Windows\System32\drivers\etc\hosts
*********************************************************************
# Copyright (c) 1993-2009 Microsoft Corp.
#
# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.
#
# This file contains the mappings of IP addresses to host names. Each
# entry should be kept on an individual line. The IP address should
# be placed in the first column followed by the corresponding host name.
# The IP address and the host name should be separated by at least one
# space.
#
# Additionally, comments (such as these) may be inserted on individual
# lines or following the machine name denoted by a '#' symbol.
#
# For example:
#
#      102.54.94.97     rhino.acme.com          # source server
#       38.25.63.10     x.acme.com              # x client host

# localhost name resolution is handled within DNS itself.
#	127.0.0.1       localhost
#	::1             localhost

127.0.0.1       localhost
#127.0.0.1       scion.dev
#127.0.0.1       scion_html.dev
#127.0.0.1       subaru.dev
#127.0.0.1       subaru_html.dev
#127.0.0.1       servco.dev
#127.0.0.1       lexus.dev
#127.0.0.1       toyota.dev
127.0.0.1       mydrupalstart.dev










******************************************************************************
(2) Drupal defaul settings.php 
C:\wamp\www\sites\default\settings.php
$base_url = 'http://www.example.com';  // NO trailing slash!
******************************************************************************



******************************************************************************
(3) apache config  (enable virtual hosts) 
C:\wamp\bin\apache\Apache2.2.11\conf\httpd.conf

# Virtual hosts
Include conf/extra/httpd-vhosts.conf
******************************************************************************



*********************************************************************
(4) apache virtual hosts 
C:\wamp\bin\apache\apache2.4.9\conf\extra\httpd-vhosts.conf
*********************************************************************
# Virtual Hosts
#
# Required modules: mod_log_config

# If you want to maintain multiple domains/hostnames on your
# machine you can setup VirtualHost containers for them. Most configurations
# use only name-based virtual hosts so the server doesn't need to worry about
# IP addresses. This is indicated by the asterisks in the directives below.
#
# Please see the documentation at 
# <URL:http://httpd.apache.org/docs/2.4/vhosts/>
# for further details before you try to setup virtual hosts.
#
# You may use the command line option '-S' to verify your virtual host
# configuration.

#
# VirtualHost example:
# Almost any Apache directive may go into a VirtualHost container.
# The first VirtualHost section is used for all requests that do not
# match a ServerName or ServerAlias in any <VirtualHost> block.
#

#<VirtualHost *:80>
#    ServerAdmin webmaster@dummy-host.example.com
#    DocumentRoot "c:/Apache24/docs/dummy-host.example.com"
#    ServerName dummy-host.example.com
#    ServerAlias www.dummy-host.example.com
#    ErrorLog "logs/dummy-host.example.com-error.log"
#    CustomLog "logs/dummy-host.example.com-access.log" common
#</VirtualHost>

#<VirtualHost *:80>
#    ServerAdmin webmaster@dummy-host2.example.com
#    DocumentRoot "c:/Apache24/docs/dummy-host2.example.com"
#    ServerName dummy-host2.example.com
#    ErrorLog "logs/dummy-host2.example.com-error.log"
#    CustomLog "logs/dummy-host2.example.com-access.log" common
#</VirtualHost>

#<VirtualHost *>
#    ServerAdmin mlee@revacomm.com
#    DocumentRoot "C:\wamp\www\toyota-hawaii"
#    ServerName toyota.dev
#    ErrorLog   "C:\wamp\logs\toyota.localhost-error.log"
#    CustomLog  "C:\wamp\logs\toyota.localhost.log" common
#</VirtualHost>

<VirtualHost *>
    ServerAdmin mlee@revacomm.com
    DocumentRoot "C:\wamp\www"
    ServerName mydrupalstart.dev
    ErrorLog   "C:\wamp\logs\mydrupalstart.localhost-error.log"
    CustomLog  "C:\wamp\logs\mydrupalstart.localhost.log" common
</VirtualHost>



**********************************************************************
(5) ipconfig /flushdns
(6) restart wamp all services
**********************************************************************
