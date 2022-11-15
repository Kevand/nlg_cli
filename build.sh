#! /usr/bin/bash

echo "Building..."

mkdir build

dart compile exe bin/nlg_cli.dart -o build/nlg
cp templates.json build/templates.json

if [ "$1" = "github-release" ]; then
    echo "Creating package"
    cd build
    zip -r "nlg_cli-$2.zip" *
    mv "nlg_cli-$2.zip" ..
    cd ..
    rm -r build
fi


