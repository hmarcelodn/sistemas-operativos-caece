#!/bin/bash

# Verificar si se envian los parametros
if [ $# -eq 0 ]
then
    echo "Missing Parameters"
    exit 1
fi


# Funcion factorial
factorial() {
    fact=1

    for (( c=1; c<=$1; c++ ))
    do  
        fact=$(($c * $fact))
    done

    echo $fact
}


factorial $1
