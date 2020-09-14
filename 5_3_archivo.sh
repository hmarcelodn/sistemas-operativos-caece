#! /bin/bash

# Ingreso de ruta de archivo
echo "Ingrese la ruta del archivo:"
read RUTA_ARCHIVO

USUARIO=$(whoami)

# Validar la existencia del archivo
if [ -f "$RUTA_ARCHIVO" ]
then
    OPERACION=0
    while [[ $OPERACION -ne 1 && $OPERACION -ne 2 ]]; do
        clear
        echo "Ingresar operacion a realizar:"
        echo "1) Comprimir?"
        echo "2) Eliminar?"
        read OPERACION
    done

    case $OPERACION in
        1)
            echo "Comprimiendo..."
            TIMESTAMP=$(date +%s)
            TARARCHIVO="$TIMESTAMP.tar"
            tar -cvf $TARARCHIVO $RUTA_ARCHIVO
            echo "$RUTA_ARCHIVO ha sido comprimido como $TARARCHIVO. "
            ;;
        2)
            echo "Eliminando..."
            RUTA_ABSOLUTA=$(readlink -f $RUTA_ARCHIVO)
            HOME_USUARIO="/home/$USUARIO"
            if [[ "$RUTA_ABSOLUTA" == *"$HOME_USUARIO"* ]]; then
                rm -f $RUTA_ARCHIVO
            else
                echo "El archivo no pertenece a /home/$USUARIO"
            fi
            
            echo "El archivo ha sido eliminado"
            ;;
    esac
else
    clear
    echo "Error: El archivo no existe."
    exit 1
fi