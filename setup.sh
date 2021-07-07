#!/bin/sh
#This setup script will make sure the ceph git repo is up to date and pulls 
#all SHA1 refs from the repo
REPO="git@github.com:ceph/ceph.git"
FILE="hashes.txt"
echo "in setup script"
#Update or clone the ceph repo
if [ -d ceph ]
then
	cd ceph
	git pull --ff-only
else
	git clone $REPO
fi

#Get SHA1's from ceph repo
git show-ref -s > $FILE
mv $FILE ..
echo "setup script finished"