#!/bin/sh
REPO="git@github.com:ceph/ceph.git"

#Update or clone the ceph repo
if [ -d ceph ]
then
	echo "ceph exists"
	cd ceph
	git pull --ff-only
else
	echo "ceph does not exist"
	git clone $REPO
fi
