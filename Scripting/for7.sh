#! /bin/bash
read -p "Introduzca el nombre de un directorio: " directorio
echo "enlaces simbólicos en el directorio
  $directorio "
for fichero in $( find $directorio -type l)
    do
	echo "$fichero"
    done
