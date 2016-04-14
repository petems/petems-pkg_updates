# pkg_updates

This module provides custom facts which return the packages with avaliable
updates for various package management systems.

It is heavily based on https://github.com/puppetlabs/puppetlabs-pkgupdates

## Warning

This will add a few seconds of time to the start and end of your Puppet runs,
as it will be running a command that can take some time. Bear that in mind!

## Facts

### pkg_updates

Hash. A hash of the packages and their avaliable updates:

```
{"NetworkManager.x86_64" => {"current"=>"1.0.6-27.el7", "update"=>"1.0.6-29.el7_2"}}
```

### pkg_updates_available

Boolean. Returns true if pkg_updates is not nil

```
pkg_updates => {"NetworkManager.x86_64" => {"current"=>"1.0.6-27.el7", "update"=>"1.0.6-29.el7_2"}}
```

Means

```
pkg_updates_available => true
```

## Example Values

