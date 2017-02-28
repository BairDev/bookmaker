#Install dependencies

### Ruby

Commands, which I recall:
`su -c "dnf install ruby"`

```
[me@localhost ~]$ ruby --version
# ruby 2.2.4p230 (2015-12-16 revision 53155) [x86_64-linux]
```

### MariaDB

`su -c "dnf install mariadb"`
followed [these instructions](http://fedoraproject.org/wiki/MariaDB)
`su -c "dnf install rubygem"`
`su -c "dnf install ruby-devel mysql-devel"`
Verifying   : mariadb-devel-1:10.0.23-1.fc23.x86_64

Then:
`[me@localhost ~]$ mysql --version`
mysql  Ver 15.1 Distrib 10.0.23-MariaDB, for Linux (x86_64) using readline 5.1

### Rubygems


### Bundler

`su -c "gem install bundler"`
`bundle install`

This installes e.g. *mysql2* in 0.4.5.

Useful: *show* (lists packages) and *outdated* (updates available?).

`bundle show` && `bundle outdated`


### node.js

**Node.js is not used yet.**

For Node.js 5.x I used the [following instructions](https://nodejs.org/en/download/package-manager/#enterprise-linux-and-fedora).