#! /bin/bash


echo "Ingrese el nombre del archivo comprimido"
read FILENAME

FILES=$(find /home -type f -name $FILENAME)

for FILE in $FILES
do
    if [[ $FILE == *".tar"* ]]; then
        CONFIRMACION=""
        while [[ "$CONFIRMACION" != "Y" && "$CONFIRMACION" != "n" ]];do
            echo "Desea eliminar el archivo $FILE ? (Y/n)"
            read CONFIRMACION
        done

        if [ "$CONFIRMACION" == "Y" ];
        then
            echo "Elinando $FILE ..."
            rm -f $FILE
            echo "$FILE ha sido eliminado"
        fi
    else 
        echo "El archivo $FILE no es un archivo comprimido."
    fi

done
