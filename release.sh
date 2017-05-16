#!/bin/bash -ex
if ! grep $1 CHANGELOG.md; then
  echo "This release not listed in CHANGELOG.md"
  exit 2
fi

echo "Testing"
./travis-build.sh

echo "Commit/tag"
git commit -am $1
git tag $1

echo "Push"
git push origin $1
git push origin master

echo "Travis will publish $1 shortly."
