# Pentaho

[![Build Status](https://api.travis-ci.org/Mylezeem/puppet-pentaho.svg?branch=master)](https://travis-ci.org/Mylezeem/puppet-pentaho)
[![Puppet Forge Version](http://img.shields.io/puppetforge/v/yguenane/pentaho.svg)](https://forge.puppetlabs.com/yguenane/pentaho)
[![Puppet Forge Downloads](http://img.shields.io/puppetforge/dt/yguenane/pentaho.svg)](https://forge.puppetlabs.com/yguenane/pentaho)
[![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with Pentaho](#setup)
    * [What Pentaho affects](#what-pentaho-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with Pentaho](#beginning-with-pentaho)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

A puppet module that allows one to install the Pentaho BA server component
on a system. This module aims to configure *only* Pentaho component and is
not responsible to configure the database or the application server.

## Module Description

As stated above this module allow one to automate the installation and configuration
of the Pentaho BA serrver. It handles the configuration of either MySQL or PostgreSQL
as a database backend. It has been tested with the Tomcat application server but
should work with any other application server.

## Setup

### What Pentaho affects

* Pentaho's pentaho-solution folder
* Pentaho's tomcat configuration
* Database backend data

### Setup Requirements

As stated above, this module only handle the Pentaho installation and configuration.
One needs to properly configure the other pieces needed to have a working environment,
database, application server, etc..

### Beginning with Pentaho

In a properly configured environment, to get started simply run :

```puppet
include ::pentaho
```

## Usage

All the interaction with the Pentaho BA server is done via `pentaho`.
Interactions with the actual tables to load in database is done via `pentaho::database`.

## Reference

### Classes

#### Public classes
* `pentaho`: Installs and configures Pentaho
* `pentaho::database`: Installs and configures required databases

#### Private classes
* `pentaho::config`: Configures the file in the pentaho-solutions directory
* `pentaho::setup`: Installs the required drivers and file to proceed with installation
* `pentaho::webapp`: Configures the web application withing the servlet container

### Parameters

####pentaho

#####`version`

The Pentaho BA server version that will be installed.

#####`applicationserver_base`

The application server directory.

#####`applicationserver_user`

The application server user name. 

#####`applicationserver_group`

The application server group name. 

#####`listen_ip`

The IP address Pentaho shoud listen on. **Note**: It is unrelated to the application server configuration, it relates strictly to the parameter that will be present in web.xml.

#####`manage_jdbc_drivers`

A list of jdbc drivers the installation should manage.

#####`db_type`

The type of the database backend.

#####`db_host`

The host of the database backend.

#####`db_port`

The port of the database backend.

#####`quartz_db_user`

The quartz database user name.

#####`quartz_db_password`

The quartz database user password.

#####`hibernate_db_user`

The hibernate database user name.

#####`hibernate_db_password`

The hibernate database user password.

#####`jackrabbit_db_user`

The jackrabbit database user name.

#####`jackrabbit_db_password`

The jackrabbit database user password.

#####`pentaho_solutions_path`

The pentaho-solutions directory path

#####`pentaho_source_url`

The pentaho source url to retrieve from.

#####`h2driver_source_url`

Since the h2 jdbc driver is not packaged, the url where to retrieve the driver from.

#####`temp_folder`

A temporary folder that will server as cache and drop temporary file into.

#####`log_directory`

The log directory.

####pentaho::database

#####`db_type`

The type of the database backend.

#####`db_host`

The host of the database backend.

#####`db_port`

The port of the database backend.

#####`quartz_db_user`

The quartz database user name.

#####`quartz_db_password`

The quartz database user password.

#####`hibernate_db_user`

The hibernate database user name.

#####`hibernate_db_password`

The hibernate database user password.

#####`jackrabbit_db_user`

The jackrabbit database user name.

#####`jackrabbit_db_password`

The jackrabbit database user password.

#####`db_charset`

The database charset

#####`db_collate`

The database collate

## Limitations

This is modules has been tested on :

### Operating Systems

* RedHat Enterprise 6
* CentOS 6

### Database backends

* MySQL (MariaDB)

### Application servers

* Tomcat

## Contributors

The list of contributors can be found at [Contributors](https://github.com/Mylezeem/puppet-rdorepo/graphs/contributors)
