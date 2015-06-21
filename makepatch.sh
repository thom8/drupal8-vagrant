#!/bin/bash

# https://www.drupal.org/node/707484

echo "Enter project name: "
read project_name
echo "Enter short description: "
read short_description
echo "Enter issue number: "
read issue_number
echo "Enter comment number: "
read comment_number

patchName="$(echo "$project_name-$short_description-$issue_number-$comment_number.patch" | tr ' ' "_")"

cd docroot
rm -rf $patchName
git fetch
git diff origin/8.0.x > $patchName
mv $patchName "../patches/$patchName"

echo "Patch file created: $patchName"