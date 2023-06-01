#!/bin/bash

# First check if the caller mounted an output folder.
# There's no use compiling esajpip if no one is going to see it.
if [ ! -d /root/out ]; then
    echo "No output folder was mounted to the container."
    echo "Please run with docker run -v <output_folder>:/root/out"
fi

# First input parameter to the script is the esajpip tag/branch to download from git.
TAG_OR_BRANCH_NAME=$1

# Update the local git repo in the container to get the latest tags and branch names.
cd /root/esajpip-1.0.0
git fetch
# Checkout the tag/branch specified by the caller
git checkout $TAG_OR_BRANCH_NAME

# Build the rpm with rpmbuild
cd /root
tar cf rpmbuild/SOURCES/esajpip.tar esajpip-1.0.0
rpmbuild -bb rpmbuild/SPECS/esajpip.spec
mv rpmbuild/RPMS/* /root/out