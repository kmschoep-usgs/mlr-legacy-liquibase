# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html). (Patch version X.Y.0 is implied if not specified.)

## [v1.4] 2018-08-10 - kmschoep@usgs.gov
### changed
- mlr-liquibase/mlr_legacy/testData/changeLog.yml to look in mlr_legacy_data for legacy_location table for all files to load

## [v1.3] 2018-08-10 - kmschoep@usgs.gov
### changed
- mlr-liquibase/mlr_legacy/testData/changeLog.yml to look in mlr_legacy_data for legacy_location table

## [v1.2] 2018-08-10 - kmschoep@usgs.gov
### changed
- mlr-liquibase/mlr_legacy/testData/changeLog.yml to look in mlr_legacy_data for legacy_location table
- mlr-liquibase/mlr_legacy/testData/changeLog.yml to add logical file path configuration

## [v1.1] 2018-08-08 - kmschoep@usgs.gov
### Added
- 1_run_liquibase.sh

### Removed
- databaseCreate.properties
- liquibase.properties
- postgres.properties

### Changed
- updated changelogs to allow for repeated running of changelogs with proper liquibase handling.

## [v1.0] 2018-07-25 - kmschoep@usgs.gov
### Added
- mlr-liquibase/changeLog.yml
- mlr-liquibase/database/changeLog.yml 
- mlr-liquibase/mlrLegacy/changeLog.yml
- mlr-liquibase/mlrLegacy/grants/changeLog.yml
- mlr-liquibase/mlrLegacy/tables/changeLog.yml
- mlr-liquibase/mlrLegacy/tables/legacyLocation/changeLog.yml
- mlr-liquibase/mlrLegacy/tables/legacyLocation/legacyLocation.sql
- mlr-liquibase/postgres/changeLog.yml
- mlr-liquibase/schema/changeLog.yml
- mlr-liquibase/databaseCreate.properties
- mlr-liquibase/liquibase.properties
- mlr-liquibase/postgres.properties
- readme.md
- mlr-liquibase/mlrLegacy/testData/changeLog.yml

### Changed
- added logicalFilePath to databaseChangeLogs