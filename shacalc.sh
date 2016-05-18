#!bin/bash
VERSION=$1
URL="https://github.com/founderbliss/bliss-cli/archive/$VERSION.tar.gz"
FILENAME="bliss-$VERSION.tar.gz"
wget -O $FILENAME $URL
FILEHASH=$(shasum -a 256 $FILENAME)
rm $FILENAME
echo $FILEHASH
