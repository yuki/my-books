#!/bin/bash

ORIG=`pwd`

LIBROS=(
    "otros/aws/ aws"
    "otros/aws_docentes/ aws_docentes"
    "otros/clonezilla/ clonezilla"
    "otros/clonezilla/euskera/ clonezilla_euskeraz"
    "otros/Docker/ docker"
    "otros/Docker/euskera/ docker_euskeraz"
    "otros/git/ git"
    "otros/hacer_documentacion/ como_hacer_documentacion"
    "otros/hacer_documentacion/euskera dokumetazioa_egiteko"
    "otros/introduccion_programacion/ introduccion_programacion"
    "otros/introduccion_programacion/euskera/ programazioan_sartu"
    "otros/angular/ angular"
    "otros/ionic/ ionic"
    "otros/laravel/ laravel"
    "otros/PFsense/ pfsense"
    "ASIR/1/planificacion_administracion_redes/ redes"
    "ASIR/2/administracion_sistemas_operativos/ aso"
    "ASIR/2/SGBD/ sgbd"
    "DAM/1/sistemas_informaticos/ sistemas_informaticos"
    "DAM/2/interfazeen_garapena/ interfazeen_garapena"
    "DAM/2/desarrollo_interfaces/ desarrollo_interfaces"
    "DAM/2/enpresa_kudeaketako_sistemak/ eks"
    "DAM/2/sistemas_gestion_empresarial/ sge"
    "SMR/1/TMM/ tmm"
    "anexos/gestion_backups/ gestion_backups"
    "anexos/glosario/ glosario"
    "anexos/instalar_ubuntu_lts/ instalar_ubuntu_lts"
    "anexos/monitorizacion_munin/ monitorizacion_munin"
    "anexos/ubuntu_raid1/ ubuntu_raid1"
    "anexos/sistemas_monitorizacion/ sistemas_monitorizacion"
    "anexos/virtualbox_networking/ virtualbox_networking"
    "temas_comunes/wsl/ wsl"
    "temas_comunes/wsl/euskera/ wsl_euskeraz"
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
