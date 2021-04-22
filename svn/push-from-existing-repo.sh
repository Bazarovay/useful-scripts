#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o xtrace
set -o pipefail

readonly REPO_NAME=$1

cd ${REPO_NAME}
git remote rm origin
git init
git remote add origin https://gitlab.com/fabric2/wam/${REPO_NAME}.git
git add .
git commit -m "Initial commit from an existing repository"
git push -u origin master
