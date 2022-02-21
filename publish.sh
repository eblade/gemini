#!/bin/bash

PUBLISH_DIR="$1"

[ -z "$PUBLISH_DIR" ] && echo "Missing argument PUBLISH_DIR" && exit 1

PUBLISH_DIR=$(readlink -f "$PUBLISH_DIR")

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd $dir

[ ! -d "$PUBLISH_DIR" ] && echo "PUBLISH_DIR does not exist" && exit 2

rm -r $PUBLISH_DIR/*
cp -r content/* "$PUBLISH_DIR"
cp -r content/.well-known "$PUBLISH_DIR"
