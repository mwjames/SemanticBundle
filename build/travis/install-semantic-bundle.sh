#!/bin/bash
set -ex

BASE_PATH=$(pwd)
MW_INSTALL_PATH=$BASE_PATH/../mw

# Run Composer installation from the MW root directory
function installToMediaWikiRoot {
	echo -e "Running MW root composer install build on $TRAVIS_BRANCH \n"

	cd $MW_INSTALL_PATH

	composer init --stability dev

	composer require 'phpunit/phpunit='$PHPU --prefer-source --update-with-dependencies
	composer require mediawiki/semantic-bundle $SB --prefer-source --dev

	cd extensions
	cd SemanticBundle

	# Pull request number, "false" if it's not a pull request
	# After the install via composer an additional get fetch is carried out to
	# update th repository to make sure that the latests code changes are
	# deployed for testing
	if [ "$TRAVIS_PULL_REQUEST" != "false" ]
	then
		git fetch origin +refs/pull/"$TRAVIS_PULL_REQUEST"/merge:
		git checkout -qf FETCH_HEAD
	else
		git fetch origin "$TRAVIS_BRANCH"
		git checkout -qf FETCH_HEAD
	fi

	cd ../..

	# Rebuild the class map for added classes during git fetch
	composer dump-autoload
}

# Running tarball build only on the master branch to detect other issues before it is merged
# because the tarball build will not contain the latests submitted version.
# We do however want to ensure noticing any breakage of this process before we prepare a release.
function installAsTarballLikeBuild {
	echo -e "Running tarball build on $TRAVIS_BRANCH \n"

	cd $MW_INSTALL_PATH/extensions
	composer create-project mediawiki/semantic-bundle SemanticBundle $SB -s dev --prefer-dist --no-dev
	
	cd SemanticBundle
	composer require 'phpunit/phpunit='$PHPU --prefer-source --update-with-dependencies
}

if [[ "$PHPU" == "" ]] ; then
  PHPU='3.7.*'
fi

if [ "$TYPE" == "composer" ] ; then
	installToMediaWikiRoot
elif [ "$TYPE" == "relbuild" ] && [ "$TRAVIS_BRANCH" == "master" ] ; then
	installAsTarballLikeBuild
else
	echo -e "Please select an install option"
fi