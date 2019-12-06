#!/bin/bash
#
TARGET_DIR=${1:-scaffold}

function setup_project () {
  # save current dir
  cwd=$(pwd)
  echo Doing work in $TARGET_DIR

  # create target dir
  mkdir $TARGET_DIR

  # move to target dir
  cd $TARGET_DIR

  # clone scaffold repo
  echo Cloning scaffold repo...
  git clone -q https://github.com/PartyLich/js-scaffold.git .

  # update package.json
  echo Updating package.json...
  sed -i -e "s/PROJECT/$TARGET_DIR/; s/USER/$USER/" package.json

  # remove .git dir
  echo Initializing git
  rm -rf .git
  # init git
  git init

  # initialize npm
  # echo installing node modules...
  # npm i

  cd $cwd
  echo \nComplete.
}


echo "Do you wish to setup in $TARGET_DIR?"
select response in "Yes" "No";
do
case $response in
    Yes ) setup_project; break;;
    No ) exit;;
esac
done
