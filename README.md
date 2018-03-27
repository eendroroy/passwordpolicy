# i_passwordcheck

[![GitHub tag](https://img.shields.io/github/tag/eendroroy/i_passwordcheck.svg)](https://github.com/eendroroy/i_passwordcheck/tags)

[![Contributors](https://img.shields.io/github/contributors/eendroroy/i_passwordcheck.svg)](https://github.com/eendroroy/i_passwordcheck/graphs/contributors)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/eendroroy/i_passwordcheck/master.svg)](https://github.com/eendroroy/i_passwordcheck)
[![license](https://img.shields.io/github/license/eendroroy/i_passwordcheck.svg)](https://github.com/eendroroy/i_passwordcheck/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/eendroroy/i_passwordcheck.svg)](https://github.com/eendroroy/i_passwordcheck/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/eendroroy/i_passwordcheck.svg)](https://github.com/eendroroy/i_passwordcheck/issues?q=is%3Aissue+is%3Aclosed)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/eendroroy/i_passwordcheck.svg)](https://github.com/eendroroy/i_passwordcheck/pulls)
[![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/eendroroy/i_passwordcheck.svg)](https://github.com/eendroroy/i_passwordcheck/pulls?q=is%3Apr+is%3Aclosed)


The `i_passwordcheck` is like the regular PostgreSQL passwordcheck extension, except it is built with cracklib. Unlike the original module, this one has more strict password checks. The `passwordcheck_cracklib` module checks users' passwords whenever they are set with `CREATE ROLE` or `ALTER ROLE`. If a password is considered too weak, it will be rejected and the command will terminate with an error. 

## Installing by compiling source code

To build it, just do this:

```
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

```
PG_CONFIG=/path/to/pg_config
```

followed by the

```
USE_PGXS=1 make
USE_PGXS=1 make install
```

`pg_config` is usually under `/usr/pgsql-10/bin/pg_config` on 
RHEL/CentOS/Fedora. Replace 10 with your major PostgreSQL version.

## Using the module

To enable this module, add '$libdir/`i_passwordcheck`' to 
shared_preload_libraries in postgresql.conf, then restart the server.

## More information

For more details, please read the manual of the original module:

https://www.postgresql.org/docs/devel/static/passwordcheck.html

## Contributing

Bug reports and pull requests are welcome on GitHub at [i_passwordcheck](https://github.com/eendroroy/i_passwordcheck) repository.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Author

* **indrajit** - *Owner* - [eendroroy](https://github.com/eendroroy)

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
