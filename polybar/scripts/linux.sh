#! /bin/sh

if [ "$(uname)" = "Linux" ];
then
	uname -r
else
	echo "Not In Linux"
fi
