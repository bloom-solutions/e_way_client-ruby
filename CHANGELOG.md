# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [1.2.0] - 2017-04-08
### Added
- Province factory

## [1.1.0] - 2017-03-27
### Added
- Added `cancel_reason` for `QueryTxnStatusResponse` so that developers could use this to describe cancelled transactions

## [1.0.1] - 2017-02-16
### Fixed
- Fixed logging of sensitive information

## [1.0.0] - 2017-02-15
### Fixed
- Fixed broken `api_client_base`

## [0.2.0] - 2017-02-13
### Added
- Option to log Savon requests
- `query_txn_status` call to get a transaction's status

## [0.1.1] - 2017-01-09
### Fixed
- Do not blow up if `diffgram` in XML response is missing. Return nil instead.

## [0.1.0] - 2016-12-31
### Added
- Initial release
