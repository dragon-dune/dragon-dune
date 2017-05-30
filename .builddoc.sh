pandoc dragon-dune.odt -o dragon-dune.md
cat "dragon-dune text board.txt" >> dragon-dune.md
cp ./dragon-dune.md dragon-dune.txt
cp ./dragon-dune.md README.md
pandoc -s dragon-dune.md -o dragon-dune.html
libreoffice --headless --convert-to pdf dragon-dune.odt

