#!/bin/bash

# do not install dependencies here
# APT & other setup commands belong in the Dockerfile

gzip --version
node --version

latexmk -pdf -file-line-error cv.tex
