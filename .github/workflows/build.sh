#!/bin/bash

set -euxo pipefail

# do not install dependencies here
# APT & other setup commands belong in the Dockerfile

gzip --version
echo | node --interactive

latexmk -pdf -file-line-error cv.tex
