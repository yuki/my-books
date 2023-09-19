#!/bin/bash

LIBROS=(
    "ASIR/1/planificacion_administracion_redes/ redes_book.tex"
#    "ASIR/1/ISO_operating_systems_deployment/ iso_en_book.tex"
    "ASIR/2/SGBD/ sgbd_book.tex"
    "DAM/1/sistemas_informaticos/ sistemas_informaticos.tex"
    "DAM/2/desarrollo_interfaces/ desarrollo_interfaces.tex"
    "DAM/2/desarrollo_interfaces/ desarrollo_interfaces.tex"
    "DAM/2/sistemas_gestion_empresarial/ sistemas_gestion_empresarial.tex"
    "SMR/2/SOred/ SOred.tex"
#
    "otros/PFsense/ pfsense_book.tex"
    "otros/Docker/ docker_book.tex"
    "otros/hacer_documentacion/ como_hacer_documentacion.tex"
    "otros/git/ git_book.tex"
    "anexos/gestion_backups gestion_backups_anexo.tex"
    "anexos/glosario glosario_anexo.tex"
    "anexos/instalar_ubuntu_lts instalar_ubuntu_lts_anexo.tex"
    "anexos/monitorizacion_munin monitorizacion_munin_anexo.tex"
    "anexos/sistemas_monitorizacion sistemas_monitorizacion_anexo.tex"
    "anexos/tabla_sistemas_numeracion tabla_sistemas_numeracion_anexo.tex"
    "anexos/ubuntu_raid1 ubuntu_raid1_anexo.tex"
    "anexos/virtualbox_networking virtualbox_networking_anexo.tex"

)

for LIBRO in "${LIBROS[@]}"; do
    RUTA=`echo $LIBRO | cut -d" " -f1`
    NAME=`echo $LIBRO | cut -d" " -f2`

#    echo $RUTA
    cd $RUTA
    lualatex -shell-escape $NAME
    makeindex $NAME
    lualatex -shell-escape $NAME
    lualatex -shell-escape $NAME

    cd ../../../
done

