# Semantic Bundle

[![Build Status](https://travis-ci.org/mwjames/SemanticBundle.svg)](https://travis-ci.org/mwjames/SemanticBundle)

Semantic Bundle (a.k.a. SB) packages extensions that depend on [Semantic MediaWiki][smw] and [MediaWiki][mw].

## Packages

Only packages that are installable via Composer and deploy unit tests (to verify that components are able to work together) fulfil the requirements to become part of the bundle.

- `mediawiki/semantic-mediawiki`
- `mediawiki/semantic-result-formats`
- `mediawiki/semantic-extra-special-properties`
- `mediawiki/semantic-glossary`
- `mediawiki/semantic-maps`

### Version management

The version scheme follows Semantic MediaWiki's master branch to indicate
the main compatibility in terms of specified dependencies.

## Installation

The recommended way to install Semantic Bundle is by using [Composer][composer].

```json
{
	"require": {
		"mediawiki/semantic-bundle": "dev-master"
	}
}
```

1. From your MediaWiki installation directory, execute
   `composer require mediawiki/semantic-bundle:@dev`
2. Navigate to _Special:Version_ on your wiki and verify that the package
   have been successfully installed.

## Tests

This extension provides unit and integration tests that are run by a [continues integration platform][travis]
but can also be executed using `composer phpunit` from the extension base directory.

Newly added packages should register its testsuite with the `phpunit.xml.dist`.

## License

[GNU General Public License, version 2 or later][gpl-licence].

[smw]: https://github.com/SemanticMediaWiki/SemanticMediaWiki/
[mw]: https://www.mediawiki.org/
[composer]: https://getcomposer.org/
[gpl-licence]: https://www.gnu.org/copyleft/gpl.html
[mw-testing]: https://www.mediawiki.org/wiki/Manual:PHP_unit_testing
