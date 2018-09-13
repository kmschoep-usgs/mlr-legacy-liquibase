# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html). (Patch version X.Y.0 is implied if not specified.)

## [v2.1] 2018-09-13 - kmschoep@usgs.gov
### Changed
- mlr-liquibase/mlr_legacy/grants/changeLog.yml, grant insert and update on mlr_legacy_data functions to mlr_legacy_user

## [v2.0] 2018-09-13 - kmschoep@usgs.gov
### Changed
- mlr-liquibase/mlr_legacy/grants/changeLog.yml, grant insert and update on mlr_legacy_data sequences to mlr_legacy_user

## [v1.9] 2018-09-13 - kmschoep@usgs.gov
### Changed
- mlr-liquibase/mlr_legacy/grants/changeLog.yml, grant insert and update on mlr_legacy_data tables to mlr_legacy_user

## [v1.8] 2018-09-11 - kmschoep@usgs.gov
### Changed
- loadData/changeLog.yml, add columns in order to be loaded

## [v1.7] 2018-09-11 - kmschoep@usgs.gov
### Changed
- loadData/changeLog.yml, added missing double-quotes

## [v1.6] 2018-09-10 - kmschoep@usgs.gov
### Added
- loadData/changeLog.yml to load generated extraction files
- populateLegacyLocation.sql to load legacy_location from legacy_location_load with some date transformations

## [v1.5] 2018-08-21 - kmschoep@usgs.gov
### changed
- removed username variables and hardcoded usernames
- removed MLR_HOST variable, hardcoded it

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