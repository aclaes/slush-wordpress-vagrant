# <%= appName %>

<%= appDescription %>

## Requirements

* Vagrant >= 1.9.0 *https://www.vagrantup.com*
* Vagrant hostsupdater plugin *https://github.com/cogitatio/vagrant-hostsupdater*
* Virtualbox => 5.0 *https://www.virtualbox.org/*
* Node.js => 6.0 *https://nodejs.org/*

## Getting started

1.) Start the virtual machine. This may take a while when doing it for the first time.

```
$ vagrant up
```

2.) Start the gulp watcher to start developing:

```
$ gulp
```

3.) Open the wordpress site in your browser:

```
http://<%= appDomain %>
```

## What's installed in the virtual machine

* Ubuntu Xenial 16.04 LTE
* Apache 2
* PHP 7
* MySQL 5.6


## Credentials

### Wordpress admin

Use this credentials to log into http://<%= appDomain %>/wp-admin

| Username      | Password      |
| ------------- | ------------- |
| admin         | admin         |

### MySQL

Wordpress users the MySQL user "wordpress" to establish a database connection.

| Username      | Password      |
| ------------- | ------------- |
| root          | root          |
| wordpress     | wordpress     |
