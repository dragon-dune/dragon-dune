#!/bin/sh
echo "Document Building Script"
echo "All documents are build from dragon-dune.md"
echo "Uses pandoc and libreoffice"

# makes readme
cp ./dragon-dune.md README.md
cat "dragon-dune board (text).txt" >> README.md

# make and copy html
cp ./art/* ./docs/art
cp ./dragon-dune.md ./docs/README.md
pandoc -s dragon-dune.md -o dragon-dune.html
cp ./dragon-dune.html ./docs/dragon-dune.html

# make odt
pandoc dragon-dune.md -o dragon-dune_unformatted.odt
# Used to make the PDF from the command line with:
# libreoffice --headless --convert-to pdf dragon-dune_unformatted.odt
# but now I do it form LibreOffice so I can set the page brakes.

# make text
pandoc dragon-dune.md -o dragon-dune.txt
cat "dragon-dune board (text).txt" >> dragon-dune.txt