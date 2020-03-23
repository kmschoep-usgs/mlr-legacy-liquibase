#!/bin/bash 

LIQUIBASE_HOME=$1
LIQUIBASE_WORKSPACE=$2
LIQUIBASE_VERSION=$3
JDBC_JAR=$4
POSTGRES_PASSWORD=$5
MLR_LEGACY_PASSWORD=$6
MLR_LEGACY_USER_PASSWORD=$7
MLR_ADDRESS=$8

# Restart postgres to make sure we can connect
if [ -n "${LOCALONLY}" ]; then 
	pg_ctl -D "$PGDATA" -m fast -o "$LOCALONLY" -w restart;
	echo "running in docker, restarted";
fi

# postgres to postgres db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/postgres/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${MLR_ADDRESS}:5432/postgres \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DMLR_LEGACY_PASSWORD=${MLR_LEGACY_PASSWORD} \
	-DMLR_LEGACY_USER_PASSWORD=${MLR_LEGACY_USER_PASSWORD} 

# postgres to mlr db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/mlr_legacy/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${MLR_ADDRESS}:5432/mlr_legacy \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} 

# remaining application scripts
${LIQUIBASE_HOME}/liquibase \
	--defaultsFile=${LIQUIBASE_HOME}/liquibase.properties \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/mlr_legacy/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${MLR_ADDRESS}:5432/mlr_legacy \
	--username=mlr_legacy \
	--password=${MLR_LEGACY_PASSWORD} \
	--logLevel=debug \
	update \
	-DMLR_LEGACY_PASSWORD=${MLR_LEGACY_PASSWORD} \
	-DMLR_LEGACY_USER_PASSWORD=${MLR_LEGACY_USER_PASSWORD}
	
# turn on auditing
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/mlr_legacy/changeLogAudit.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${MLR_ADDRESS}:5432/mlr_legacy \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} 
