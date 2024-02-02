#!/bin/bash

ORIG=`pwd`

LIBROS=(
    "otros/aws/ aws_book"
)

for LIBRO in "${LIBROS[@]}"; do
    RUTA=`echo $LIBRO | cut -d" " -f1`
    NAME=`echo $LIBRO | cut -d" " -f2`

    cd $RUTA
    ./`echo $RUTA.sh` | pandoc -o $NAME.pdf -d defaults.yaml
    ./`echo $RUTA.sh` | pandoc -o $NAME.html -d defaults.yaml  --template=template/yuki.tex

    cd $ORIG
done

