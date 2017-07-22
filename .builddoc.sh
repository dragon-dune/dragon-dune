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
pandoc dragon-dune.md -o dragon-dune_unformatted.docx
pandoc dragon-dune_unformatted.docx -o dragon-dune_unformatted.odt
rm dragon-dune_unformatted.docx

# make text
pandoc dragon-dune.md -o dragon-dune.txt
cat "dragon-dune board (text).txt" >> dragon-dune.txt

# set to dos newlines
unix2dos *.txt
unix2dos *.md
unix2dos *.html
cd art
unix2dos *.txt
unix2dos *.md
unix2dos *.html
cd ..
cd docs
unix2dos *.txt
unix2dos *.md
unix2dos *.html
cd ..
