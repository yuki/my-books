#!/bin/bash

ORIG=`pwd`

LIBROS=(
    "otros/aws/ aws_book"
    "otros/Docker/ docker_book"
    "otros/git/ git_book"
    "otros/laravel/ laravel_book"
    "otros/PFsense/ pfsense_book"
    "DAM/2/desarrollo_interfaces/ desarrollo_interfaces_book"
    "DAM/2/sistemas_gestion_empresarial/ sge_book"
    "anexos/gestion_backups/ gestion_backups_anexo"
)

TODO="$(echo $COMPILEBOOK | tr '[:upper:]' '[:lower:]')"


for LIBRO in "${LIBROS[@]}"; do
    RUTA=`echo $LIBRO | cut -d" " -f1`
    NAME=`echo $LIBRO | cut -d" " -f2`
    
    cd $RUTA
    wget "https://yuki.github.io/my-books/$NAME.html"
    wget "https://yuki.github.io/my-books/$NAME.pdf"

    if [ "$TODO" = "all" ] || [ "${TODO}_book" = "$NAME" ] ; then
        echo "BUILDING $NAME.html"
        ./`echo $NAME.sh` | pandoc -o $NAME.html -d defaults.yaml --verbose
        echo "BUILDING $NAME.pdf"
        ./`echo $NAME.sh` | pandoc -o $NAME.pdf -d defaults.yaml  --template=template/yuki.tex --verbose
    fi
    cp $NAME.html $ORIG/build
    cp $NAME.pdf $ORIG/build
    cd $ORIG

done

mv pandoc-templates/template build
mv img build 
