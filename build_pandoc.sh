#!/bin/bash

ORIG=`pwd`

LIBROS=(
    "otros/aws/ aws_book"
    "otros/Docker/ docker_book"
    "otros/git/ git_book"
)

for LIBRO in "${LIBROS[@]}"; do
    RUTA=`echo $LIBRO | cut -d" " -f1`
    NAME=`echo $LIBRO | cut -d" " -f2`

    cd $RUTA
    ./`echo $NAME.sh` | pandoc -o $NAME.html -d defaults.yaml
    ./`echo $NAME.sh` | pandoc -o $NAME.pdf -d defaults.yaml  --template=template/yuki.tex
    
    cp $NAME.html $ORIG/build
    cp $NAME.pdf $ORIG/build

    cd $ORIG
done

mv pandoc-templates/template build
mv img build 
