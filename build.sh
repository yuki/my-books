#!/bin/sh

cd "SMR/2º/Sistemas operativos en red/"

pdflatex -shell-escape SOred.tex
makeindex SOred.tex
pdflatex -shell-escape SOred.tex
pdflatex -shell-escape SOred.tex

cd ../../../

cd "ASIR/2º/SGBD/"
pdflatex -shell-escape sgbd_book.tex
makeindex sgbd_book.tex
pdflatex -shell-escape sgbd_book.tex
pdflatex -shell-escape sgbd_book.tex

cd ../../../

cd "otros/PFsense/"

pdflatex -shell-escape pfsense_book.tex
makeindex pfsense_book.tex
pdflatex -shell-escape pfsense_book.tex
pdflatex -shell-escape pfsense_book.tex

#LIBRO=$1
#ACTION=0
#
#if [ $# -eq 1 ]; then
#
#    case "$LIBRO" in
#      "SOred") cd "SMR/2º/Sistemas operativos en red/";ACTION=1;;
#    esac 
#    
#    if [ $ACTION -eq 1 ]; then
#        pdflatex -shell-escape $LIBRO.tex
#        #biber $LIBRO.tex
#        makeindex $LIBRO.tex
#        
#        pdflatex -shell-escape $LIBRO.tex
#        pdflatex -shell-escape $LIBRO.tex
#    else
#        echo "ERROR! Introduced book does not exists"
#        exit 2
#    fi
#
#else 
#    echo "ERROR! No book"
#    exit 1
#
#fi
