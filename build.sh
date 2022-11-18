#! /usr/bin/bash

echo "Building..."



if [ "$1" = "release" ]; then
    mkdir build
    dart compile exe bin/nlg_cli.dart -o build/nlg
    cp templates.json build/templates.json
    echo "Creating package"
    cd build
    zip -r "nlg_cli-$2.zip" *
    mv "nlg_cli-$2.zip" ..
    cd ..
    rm -r build
fi

if [ "$1" = "local" ]; then
    toolPath=~/.tools/nlg_cli
    mkdir "$toolPath"
    dart compile exe bin/nlg_cli.dart -o "$toolPath/nlg"
    cp templates.json "$toolPath/templates.json"
    echo "Finished"
fi


