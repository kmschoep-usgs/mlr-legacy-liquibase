# mlr-legacy-liquibase
Liquibase scripts to create MLR legacy database and objects and populate with data

To execute against a local database, run `mlr-liquibase/dbInit/./1_run_liquibase.sh` with the necessary arguments.  If running against a dockerized postgres database, make sure the `MLR_PORT` argument is set to the port that docker exposes.
