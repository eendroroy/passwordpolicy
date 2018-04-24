# passwordpolicy

[![GitHub tag](https://img.shields.io/github/tag/eendroroy/passwordpolicy.svg)](https://github.com/eendroroy/passwordpolicy/tags)

[![Contributors](https://img.shields.io/github/contributors/eendroroy/passwordpolicy.svg)](https://github.com/eendroroy/passwordpolicy/graphs/contributors)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/eendroroy/passwordpolicy/master.svg)](https://github.com/eendroroy/passwordpolicy)
[![license](https://img.shields.io/github/license/eendroroy/passwordpolicy.svg)](https://github.com/eendroroy/passwordpolicy/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/eendroroy/passwordpolicy.svg)](https://github.com/eendroroy/passwordpolicy/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/eendroroy/passwordpolicy.svg)](https://github.com/eendroroy/passwordpolicy/issues?q=is%3Aissue+is%3Aclosed)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/eendroroy/passwordpolicy.svg)](https://github.com/eendroroy/passwordpolicy/pulls)
[![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/eendroroy/passwordpolicy.svg)](https://github.com/eendroroy/passwordpolicy/pulls?q=is%3Apr+is%3Aclosed)


The `passwordpolicy` is like the regular PostgreSQL passwordcheck extension, except it is built with cracklib and has some configurations options. Unlike the original module, this one has more strict password checks. The `passwordpolicy` module checks users' passwords whenever they are set with `CREATE ROLE` or `ALTER ROLE`. If a password is considered too weak, it will be rejected and the command will terminate with an error. 

## Installing by compiling source code

**Prerequisit**

`Ubuntu`:

```bash
# add postgres repo
add-apt-repository 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# install postgres
apt-get -y update
apt-get -y install postgresql postgresql-contrib libpq-dev postgresql-server-dev-all

# install build requirements
apt-get -y install make build-essential

# install cracklib
apt-get -y install libpam-cracklib libcrack2-dev
```


`RHEL`:

```bash
yum -y install openssl-devel

# add postgres repo
rpm -Uvh https://yum.postgresql.org/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm

# install postgres
yum -y install postgresql10-server postgresql10-libs postgresql10-devel postgresql10-contrib

# install cracklib
yum -y install cracklib cracklib-devel cracklib-dicts words

# create dictionary
mkdict /usr/share/dict/* | packer /usr/lib/cracklib_dict

# initialize databasse
/usr/pgsql-10/bin/postgresql-10-setup initdb
```

To build it, just do this:

```bash
USE_PGXS=1 make
USE_PGXS=1 make install
```

If you encounter an error such as:

```
make: pg_config: Command not found
```

Be sure that you have pg_config installed and in your path. If you used 
a package management system such as RPM to install PostgreSQL, be sure 
that the -devel package is also installed. If necessary tell the build 
process where to find it. Edit Makefile, and change PG_CONFIG variable:

```bash
PG_CONFIG=/path/to/pg_config
```

followed by the

```bash
USE_PGXS=1 make
USE_PGXS=1 make install
```

`pg_config` is usually under `/usr/pgsql-10/bin/pg_config` on 
RHEL/CentOS/Fedora. Replace 10 with your major PostgreSQL version.

Alternatively the following will work too:

```bash
PATH="/usr/pgsql-10/bin:$PATH" USE_PGXS=1 make
sudo PATH="/usr/pgsql-10/bin:$PATH" USE_PGXS=1 make install
```

## Using the module

To enable this module, add '`$libdir/passwordpolicy`' to 
shared_preload_libraries in postgresql.conf, then restart the server.

## Configurations

Configure the `passwordpolicy` plugin in `postgresql.conf`.

```
# Set minimum Password length:
p_policy.min_password_len = 8

# Set minimum number of special chracters:
p_policy.min_special_chars = 2

# Set minimum number of numeric characters:
p_policy.min_numbers = 2

# Set minimum number of upper case letters:
p_policy.min_uppercase_letter = 2

# Set minimum number of lower casae letters:
p_policy.min_lowercase_letter = 2
```

## Testing

Using vagrant:

```bash
vagrant up
vagrant provision --provision-with bootstrap
vagrant provision --provision-with install
vagrant provision --provision-with config
vagrant provision --provision-with test
```

## More information

For more details, please read the manual of the original module:

[https://www.postgresql.org/docs/current/static/passwordcheck.html](https://www.postgresql.org/docs/current/static/passwordcheck.html)

## Contributing

Bug reports and pull requests are welcome on GitHub at [passwordpolicy](https://github.com/eendroroy/passwordpolicy) repository.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Author

* **indrajit** - *Owner* - [eendroroy](https://github.com/eendroroy)

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
