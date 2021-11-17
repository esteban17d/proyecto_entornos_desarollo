#! /bin/bash

j=0
cantidad_evaluaciones=0
while [ $cantidad_evaluaciones -lt 1 ]
do
	if [ $j -gt 0 ]; then
		echo 'Ingresa una cantidad válida'
	fi	
    echo 'Ingresa la cantidad evaluaciones realizadas en tu trimestre: '
	read cantidad_evaluaciones
	j=$(( $j + 1 ))
done
suma_notas=0
notas=()
x=1
nota=-1

while [ $x -le $cantidad_evaluaciones ]
do
	j=0
    while [ $nota -lt 0 ] || [ $nota -gt 20 ]
    do
    	if [ $j -gt 0 ]; then
			echo 'Ingresa una cantidad válida'
		fi
        echo "Ingresa la nota de la $x evaluación"
        read nota
        j=$(( $j + 1 ))
    done    
    notas=("${notas[@]}" $nota)
    suma_notas=$(($suma_notas + $nota))
    x=$(( $x + 1 ))
    nota=-1
done

x=0

while [ $x -le $(($cantidad_evaluaciones - 1)) ]
do
    echo "La nota de la $(($x + 1)) evaluación es: ${notas[$x]}"
    x=$(( $x + 1 ))
done

echo "Promedio: $(($suma_notas/$cantidad_evaluaciones))"

nota_mayor=0
nota_menor=20
x=0

while [ $x -le $(($cantidad_evaluaciones - 1)) ]
do
	if [ ${notas[$x]} -ge $nota_mayor ]; then
		nota_mayor=${notas[$x]}
	fi
    x=$(( $x + 1 ))
done
echo "La nota mayor es $nota_mayor"

x=0

while [ $x -le $(($cantidad_evaluaciones - 1)) ]
do
	if [ ${notas[$x]} -le $nota_menor ]; then
		nota_menor=$((${notas[$x]}))
	fi
    x=$(( $x + 1 ))
done
echo "La nota menor es $nota_menor"

