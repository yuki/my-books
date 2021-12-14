#!/bin/sh

LIBRO=$1
ACTION=0

if [ $# -eq 1 ]; then

    case "$LIBRO" in
      "SOred") cd "SMR/2º/Sistemas operativos en red/";ACTION=1;;
    esac 
    
    if [ $ACTION -eq 1 ]; then
        pdflatex -shell-escape $LIBRO.tex
        #biber $LIBRO.tex
        makeindex $LIBRO.tex
        
        pdflatex -shell-escape $LIBRO.tex
        pdflatex -shell-escape $LIBRO.tex
    else
        echo "ERROR! Introduced book does not exists"
        exit 2
    fi

else 
    echo "ERROR! No book"
    exit 1

fi
