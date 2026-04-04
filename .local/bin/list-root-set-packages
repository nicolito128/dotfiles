#!/bin/bash

# Author: Collin McKinley (https://cmckinley.org/debian-scripts/)

PKGS=$(grep "^Package: " /var/lib/dpkg/status | awk '{print $2}')

echo "$PKGS" | while IFS= read -r pkg
do
    if ! grep --quiet "Depends: .*$pkg.*" /var/lib/dpkg/status
    then
        echo "$pkg"
    fi
done
