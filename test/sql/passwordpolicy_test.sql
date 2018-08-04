LOAD 'passwordpolicy';

CREATE USER test_pass WITH PASSWORD 'aaaa';

CREATE USER test_pass WITH PASSWORD 'aaaaaaaaaaaa';

CREATE USER test_pass WITH PASSWORD 'aaaaaaaa1234';

CREATE USER test_pass WITH PASSWORD 'aaaaaa#*#134';

CREATE USER test_pass WITH PASSWORD 'ASWsdf#*#134';

DROP USER IF EXISTS test_pass;