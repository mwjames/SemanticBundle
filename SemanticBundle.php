<?php

/**
 * @see https://github.com/SemanticMediaWiki/SemanticBundle/
 *
 * @defgroup SB Semantic Bundle
 */
call_user_func( function () {

	if ( !defined( 'MEDIAWIKI' ) ) {
		die( 'This file is part of the SemanticBundle extension, it is not a valid entry point.' );
	}

	if ( version_compare( $GLOBALS[ 'wgVersion' ], '1.19', 'lt' ) ) {
		die( '<b>Error:</b> This version of <a href="https://github.com/SemanticMediaWiki/SemanticBundle/">SemanticBundle</a> is only compatible with MediaWiki 1.19 or above. You need to upgrade MediaWiki first.' );
	}

	define( 'SB_VERSION', '2.0' );

	// Register the extension
	$GLOBALS[ 'wgExtensionCredits' ][ 'semantic' ][ ] = array(
		'path'           => __FILE__,
		'name'           => 'Semantic Bundle',
		'author'         => array( 'mwjames' ),
		'url'            => 'https://github.com/SemanticMediaWiki/SemanticBundle/',
		'descriptionmsg' => 'Semantic Bundle packages extensions that depend on Semantic MediaWiki and MediaWiki.',
		'version'        => SB_VERSION,
		'license-name'   => 'GPL-2.0+',
	);

} );
