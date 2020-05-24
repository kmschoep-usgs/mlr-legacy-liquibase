# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html). (Patch version X.Y.0 is implied if not specified.)

## [Unreleased]
### Added
- 2020-04-14 - kmschoep@usgs.gov: audit logging via an audit schema, triggers and functions to track all CRUD operations
- 2020-04-14 - kmschoep@usgs.gov: logged_actions_vw, which queries the logged_actions table.
- 2020-05-24 - kmschoep@usgs.gov: Add comment to legacy_location table.

## [v2.3] 2019-04-12 - zmoore@usgs.gov - End of Pilot
### Changed
- No changes, release marks the end of the pilot

## [v2.2] 2018-11-30 - mhines@usgs.gov
### Changed
- Made tz_cd 6 characters

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

[Unreleased]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v2.3...master
[v2.3]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v2.2...v2.3
[v2.2]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v2.1...v2.2
[v2.1]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v2.0...v2.1
[v2.0]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v1.9...v2.0
[v1.9]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v1.8...v1.9
[v1.8]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v1.7...v1.8
[v1.7]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v1.6...v1.7
[v1.6]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v1.5...v1.6
[v1.5]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v1.4...v1.5
[v1.4]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v1.3...v1.4
[v1.3]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v1.2...v1.3
[v1.2]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v1.1...v1.2
[v1.1]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/compare/v1.0...v1.1
[v1.0]: https://github.com/USGS-CIDA/mlr-legacy-liquibase/releases/tag/v1.0