<?php

if ( php_sapi_name() !== 'cli' ) {
	die( 'Not an entry point' );
}

if ( !defined( 'SMW_VERSION' ) ) {
	die( 'SemanticMediaWiki is not available.' );
}

/**
 * Maintenance classes are registered separately therefore we need to
 * use the original boostrap
 */
ob_start();

require __DIR__ . '/../../SemanticMediaWiki/tests/bootstrap.php';
require __DIR__ . '/../../SemanticGlossary/tests/bootstrap.php';

ob_get_clean();

print( "\nSemanticMediaWiki " . SMW_VERSION . " ({$GLOBALS['wgDBtype']}) test autoloader ...\n" );

$autoloader = require __DIR__ . '/../../SemanticMediaWiki/tests/autoloader.php';
$autoloader->addPsr4( 'SB\\Tests\\', __DIR__ . '/phpunit' );
