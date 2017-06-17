#!/bin/sh
echo "Document Building Script"
echo "All documents are build from dragon-dune.md"
echo "Uses pandoc and libreoffice"

# makes readme
cp ./dragon-dune.md README.md
cat "dragon-dune board (text).txt" >> README.md

# makes and copy html
cp ./art/* ./docs/art
cp ./dragon-dune.md ./docs/README.md
pandoc -s dragon-dune.md -o dragon-dune.html
cp ./dragon-dune.html ./docs/dragon-dune.html

# make odt and pdf
pandoc dragon-dune.md -o dragon-dune.odt
libreoffice --headless --convert-to pdf dragon-dune.odt

# make text
cp ./dragon-dune.md dragon-dune.txt
cat "dragon-dune board (text).txt" >> dragon-dune.txt