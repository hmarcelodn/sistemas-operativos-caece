#!/bin/bash

# Verificar si se envian los parametros
if [ $# -eq 0 ]
then
    echo "Missing Parameters"
    exit 1
fi

# Funcion de verificacion de usuarios
get_connected_users(){
    CONNECTED=$(users | grep $1 | wc -l)

    if [ $CONNECTED -gt 0 ] 
    then
        echo "YES"
    else
        echo "NO"
    fi
}

get_connected_users $1

exit 0