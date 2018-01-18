#!/bin/sh

SDK_VERSION=$(cat package.json | sed -n -e '/version/ s/.*: *"\([^"]*\).*/\1/p')
echo "Building JavaScript SDK v$SDK_VERSION...\n"

echo "Cleaning up old builds...\n"
rm -rf dist lib

echo "Browser Release:"
PARSE_BUILD=browser gulp compile
echo "Node.js Release:"
PARSE_BUILD=node gulp compile
echo "React Native Release:"
PARSE_BUILD=react-native gulp compile
echo "WeChat Release:"
PARSE_BUILD=wechat gulp compile
echo "Bundling and minifying for CDN distribution:"

gulp browserify
gulp minify

echo "Bundling and minifying for WeChat Mini Program"
gulp wechatfy
gulp wechatminify
