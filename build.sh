#!/bin/sh

LIBRO=$1

case "$LIBRO" in
  "") echo "ERROR. No book"; exit 1;;

  "SOred") cd "SMR/2º/Sistemas operativos en red/";;
esac 


pdflatex $LIBRO.tex
#biber $LIBRO.tex
makeindex $LIBRO.tex

pdflatex $LIBRO.tex
pdflatex $LIBRO.tex
