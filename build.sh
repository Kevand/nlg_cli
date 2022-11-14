#! /usr/bin/bash

dart compile exe bin/nlg_cli.dart -o build/nlg
cp templates.json build/templates.json