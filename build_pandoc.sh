#!/bin/bash

ORIG=`pwd`

LIBROS=(
    "otros/aws/ aws"
    "otros/aws_docentes/ aws_docentes"
    "otros/Docker/ docker"
    "otros/git/ git"
    "otros/hacer_documentacion/ como_hacer_documentacion"
    "otros/laravel/ laravel"
    "otros/PFsense/ pfsense"
    "ASIR/2/administracion_sistemas_operativos/ aso"
    "ASIR/2/SGBD/ sgbd"
    "DAM/1/sistemas_informaticos/ sistemas_informaticos"
    "DAM/2/desarrollo_interfaces/ desarrollo_interfaces"
    "DAM/2/sistemas_gestion_empresarial/ sge"
    "anexos/gestion_backups/ gestion_backups"
    "anexos/instalar_ubuntu_lts/ instalar_ubuntu_lts"
    "anexos/monitorizacion_munin/ monitorizacion_munin"
    "anexos/ubuntu_raid1/ ubuntu_raid1"
    "anexos/sistemas_monitorizacion/ sistemas_monitorizacion"
    "anexos/virtualbox_networking/ virtualbox_networking"
)

TODO="$(echo $COMPILEBOOK | tr '[:upper:]' '[:lower:]')"

cp -r pandoc-templates/template build
cp -r img build 

for LIBRO in "${LIBROS[@]}"; do
    RUTA=`echo $LIBRO | cut -d" " -f1`
    NAME=`echo $LIBRO | cut -d" " -f2`
    
    cd $RUTA
    wget "https://yuki.github.io/my-books/$NAME.html"
    wget "https://yuki.github.io/my-books/$NAME.pdf"

    if [ "$TODO" = "all" ] || [ "${TODO}" = "$NAME" ] ; then
        echo "BUILDING $NAME.html"
        ./book.sh | pandoc -o $NAME.html -d defaults.yaml --verbose
        echo "BUILDING $NAME.pdf"
        ./book.sh | pandoc -o $NAME.pdf -d defaults.yaml  --template=template/yuki.tex --verbose
    fi
    cp $NAME.html $ORIG/build
    cp $NAME.pdf $ORIG/build
    cd $ORIG

done
