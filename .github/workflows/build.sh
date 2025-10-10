#!/bin/bash

set -euxo pipefail

# do not install dependencies here
# APT & other setup commands belong in the Dockerfile

gzip --version
tar --version
echo | node --interactive
ldd "$(which node)"

latexmk -pdf -file-line-error cv.tex
