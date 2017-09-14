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
pandoc dragon-dune.md -s -c style.css -o ./docs/dragon_dune.html

# make odt
# To set image dpi use: for file in *.png; do mogrify -density 160 -units PixelsPerInch $file; done
pandoc dragon-dune.md -o dragon-dune_unformatted.odt

# make text
pandoc dragon-dune.md -o dragon-dune.txt
cat "dragon-dune board (text).txt" >> dragon-dune.txt
sed -i '/^[@!]/ d' dragon-dune.txt

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
