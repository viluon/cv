#!/bin/bash

# do not install dependencies here
# APT & other setup commands belong in the Dockerfile

git --version
gzip --version

latexmk -pdf -file-line-error cv.tex;
