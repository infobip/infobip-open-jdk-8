#!/bin/bash

PATCH_VERSION=1
JDK_VERSION="1.8.0-40"
VERSION=$JDK_VERSION-IB$PATCH_VERSION

TEMP_DIR=jvm-$VERSION
OUTPUT_ZIP=jvm-$VERSION-linux.zip
EXCLUDE1=lib/amd64/server/*.diz
EXCLUDE2=lib/amd64/*.diz

rm $TEMP_DIR -fr
rm $OUTPUT_ZIP -f

echo "Creating temp dir $TEMP_DIR..."
mkdir -p $TEMP_DIR
echo "Copying to temp dir..."
cp -r build/linux-x86_64-normal-server-release/jdk/bin/ $TEMP_DIR/
cp -r build/linux-x86_64-normal-server-release/jdk/lib/ $TEMP_DIR/
cp -r build/linux-x86_64-normal-server-release/jdk/classes/ $TEMP_DIR/
cd $TEMP_DIR
rm bin/*diz
echo "Zipping..."
zip -r ../$OUTPUT_ZIP * -x $EXCLUDE1 -x $EXCLUDE2
cd ..
echo "Removing temp dir..."
rm $TEMP_DIR -fr
echo "Done $OUTPUT_ZIP"
