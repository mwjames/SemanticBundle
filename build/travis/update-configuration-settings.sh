#!/bin/bash
set -ex

BASE_PATH=$(pwd)
MW_INSTALL_PATH=$BASE_PATH/../mw

cd $MW_INSTALL_PATH

# Namespace related settings
echo 'define("NS_TRAVIS", 998);' >> LocalSettings.php
echo 'define("NS_TRAVIS_TALK", 999);' >> LocalSettings.php
echo '$wgExtraNamespaces[NS_TRAVIS] = "Travis";' >> LocalSettings.php
echo '$wgExtraNamespaces[NS_TRAVIS_TALK] = "Travis_talk";' >> LocalSettings.php
echo '$wgNamespacesWithSubpages[NS_TRAVIS] = true;' >> LocalSettings.php

echo '$smwgNamespacesWithSemanticLinks = array( NS_MAIN => true, NS_IMAGE => true, NS_TRAVIS => true );' >> LocalSettings.php
echo '$smwgNamespace = "http://example.org/id/";' >> LocalSettings.php

# Error reporting
echo 'error_reporting(E_ALL| E_STRICT);' >> LocalSettings.php
echo 'ini_set("display_errors", 1);' >> LocalSettings.php
echo '$wgShowExceptionDetails = true;' >> LocalSettings.php
echo '$wgDevelopmentWarnings = true;' >> LocalSettings.php
echo '$wgShowSQLErrors = true;' >> LocalSettings.php
echo '$wgDebugDumpSql = false;' >> LocalSettings.php
echo '$wgShowDBErrorBacktrace = true;' >> LocalSettings.php
echo "putenv( 'MW_INSTALL_PATH=$(pwd)' );" >> LocalSettings.php

php maintenance/update.php --quick
