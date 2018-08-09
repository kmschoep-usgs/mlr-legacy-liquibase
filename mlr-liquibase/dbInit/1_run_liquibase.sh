#!/bin/bash 

LIQUIBASE_HOME=$1
LIQUIBASE_WORKSPACE=$2
LIQUIBASE_VERSION=$3
JDBC_JAR=$4
POSTGRES_PASSWORD=$5
MLR_LEGACY=$6
MLR_LEGACY_PASSWORD=$7
MLR_LEGACY_USER=$8
MLR_LEGACY_USER_PASSWORD=$9
MLR_LEGACY_DATA=${10}
MLR_ADDRESS=${11}
MLR_PORT=${12}

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
	--url=jdbc:postgresql://${MLR_ADDRESS}:${MLR_PORT}/postgres \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DMLR_LEGACY_DATABASE_NAME=${MLR_LEGACY} \
	-DMLR_LEGACY=${MLR_LEGACY} \
	-DMLR_LEGACY_PASSWORD=${MLR_LEGACY_PASSWORD} \
	-DMLR_LEGACY_USER=${MLR_LEGACY_USER} \
	-DMLR_LEGACY_USER_PASSWORD=${MLR_LEGACY_USER_PASSWORD} 

# postgres to mlr db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/mlr_legacy/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${MLR_ADDRESS}:${MLR_PORT}/${MLR_LEGACY} \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DMLR_LEGACY_DATABASE_NAME=${MLR_LEGACY} \
	-DMLR_LEGACY_USER=${MLR_LEGACY_USER} \
	-DMLR_LEGACY_SCHEMA_NAME=${MLR_LEGACY_DATA} 

# remaining application scripts
${LIQUIBASE_HOME}/liquibase \
	--defaultsFile=${LIQUIBASE_HOME}/liquibase.properties \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/${MLR_LEGACY}/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${MLR_ADDRESS}:${MLR_PORT}/${MLR_LEGACY} \
	--username=${MLR_LEGACY} \
	--password=${MLR_LEGACY_PASSWORD} \
	--logLevel=debug \
	update \
	-DMLR_LEGACY=${MLR_LEGACY} \
	-DMLR_LEGACY_PASSWORD=${MLR_LEGACY_PASSWORD} \
	-DMLR_LEGACY_USER=${MLR_LEGACY_USER} \
	-DMLR_LEGACY_USER_PASSWORD=${MLR_LEGACY_USER_PASSWORD} \
	-DMLR_LEGACY_DATABASE_NAME=${MLR_LEGACY} \
	-DMLR_LEGACY_SCHEMA_NAME=${MLR_LEGACY_DATA} 
