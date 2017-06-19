#! /bin/bash

SRC_DIR=rpi

# make a directory to download to
rm -rf $SRC_DIR
mkdir $SRC_DIR

# download the zip from a raspberrypi repo and extract in the source directory
function download_and_extract_repo {
  repo_name=$1
  branch=$2
  pushd $SRC_DIR
  echo "Downloading repo $repo_name..."
  wget -O "$repo_name.tar.gz" "https://github.com/raspberrypi/$repo_name/archive/$branch.tar.gz"
  echo "Extracting repo $repo_name..."
  tar -xf "$repo_name.tar.gz"
  mv "$repo_name-$branch" "$repo_name"
  echo "Done with $repo_name!"
  popd
}

# download and unzip the source repositories

download_and_extract_repo linux 2d31cd571e6f2ac61a3eda273d973058e1bb1f58
download_and_extract_repo tools master
download_and_extract_repo firmware 8979042e904fb8fe8cd16fa470e06049bf0971cb
