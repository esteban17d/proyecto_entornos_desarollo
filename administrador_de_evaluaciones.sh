#! /bin/bash

echo 'Ingresa la cantidad evaluaciones realizadas en tu trimestre: '
read cantidad_evaluaciones
suma_notas=0
notas=()
x=1
nota=0

while [ $x -le $cantidad_evaluaciones ]
do
    while [ $nota -lt 1 ] || [ $nota -gt 20 ]
    do
        echo "Ingresa la nota de la $x evaluación"
        read nota
    done    
    notas=("${notas[@]}" $nota)
    suma_notas=$(($suma_notas + $nota))
    x=$(( $x + 1 ))
    nota=0
done

x=0

while [ $x -le $(($cantidad_evaluaciones - 1)) ]
do
    echo "La nota de la $(($x + 1)) evaluación es: ${notas[$x]}"
    x=$(( $x + 1 ))
done

echo "Promedio: $(($suma_notas/$cantidad_evaluaciones))"
