#!/bin/bash

repo='mrirecon/bart'
newversion=$(curl --silent "https://api.github.com/repos/$repo/releases/latest" | \
                 grep "tag_name" | \
                 egrep -o '[0-9.]+' | \
                 tr -d '\n')

echo "version $newversion"

sed -Ei '' -e 's/version "[0-9.]+"/version "'"$newversion"'"/' bart.rb
