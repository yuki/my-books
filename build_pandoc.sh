#!/bin/bash

ORIG=`pwd`

LIBROS=(
    "otros/aws/ aws_book"
    "otros/Docker/ docker_book"
    "otros/git/ git_book"
    "otros/hacer_documentacion/ como_hacer_documentacion_book"
    "otros/laravel/ laravel_book"
    "otros/PFsense/ pfsense_book"
    "ASIR/2/administracion_sistemas_operativos/ aso_book"
    "DAM/1/sistemas_informaticos/ si_book"
    "DAM/2/desarrollo_interfaces/ desarrollo_interfaces_book"
    "DAM/2/sistemas_gestion_empresarial/ sge_book"
    "anexos/gestion_backups/ gestion_backups_anexo"
    "anexos/instalar_ubuntu_lts/ instalar_ubuntu_lts_anexo"
    "anexos/monitorizacion_munin/ monitorizacion_munin_anexo"
    "anexos/ubuntu_raid1/ ubuntu_raid1_anexo"
    "anexos/sistemas_monitorizacion/ sistemas_monitorizacion_anexo"
    "anexos/virtualbox_networking/ virtualbox_networking_anexo"
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

    if [ "$TODO" = "all" ] || [ "${TODO}_book" = "$NAME" ] || [ "${TODO}_anexo" = "$NAME" ] ; then
        echo "BUILDING $NAME.html"
        ./`echo $NAME.sh` | pandoc -o $NAME.html -d defaults.yaml --verbose
        echo "BUILDING $NAME.pdf"
        ./`echo $NAME.sh` | pandoc -o $NAME.pdf -d defaults.yaml  --template=template/yuki.tex --verbose
    fi
    cp $NAME.html $ORIG/build
    cp $NAME.pdf $ORIG/build
    cd $ORIG

done
