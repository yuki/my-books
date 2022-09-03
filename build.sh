#!/bin/sh

cd "SMR/2/SOred/"

lualatex -shell-escape SOred.tex
makeindex SOred.tex
lualatex -shell-escape SOred.tex
lualatex -shell-escape SOred.tex

cd ../../../

cd "ASIR/1/planificacion_administracion_redes/"
lualatex -shell-escape redes_book.tex
makeindex redes_book.tex
lualatex -shell-escape redes_book.tex
lualatex -shell-escape redes_book.tex

cd ../../../

cd "ASIR/2/SGBD/"
lualatex -shell-escape sgbd_book.tex
makeindex sgbd_book.tex
lualatex -shell-escape sgbd_book.tex
lualatex -shell-escape sgbd_book.tex

cd ../../../

cd "otros/PFsense/"

lualatex -shell-escape pfsense_book.tex
makeindex pfsense_book.tex
lualatex -shell-escape pfsense_book.tex
lualatex -shell-escape pfsense_book.tex

cd ../../../

cd "otros/hacer_documentacion/"

lualatex -shell-escape como_hacer_documentacion.tex
makeindex como_hacer_documentacion.tex
lualatex -shell-escape como_hacer_documentacion.tex
lualatex -shell-escape como_hacer_documentacion.tex



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
#        lualatex -shell-escape $LIBRO.tex
#        #biber $LIBRO.tex
#        makeindex $LIBRO.tex
#        
#        lualatex -shell-escape $LIBRO.tex
#        lualatex -shell-escape $LIBRO.tex
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
