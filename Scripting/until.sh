#! /bin/bash
echo "Introduzca un número: "; read x
echo ;
until [ "$x" -le 0 ]; do
  echo $x
  x=$(($x-1))
  sleep 1
done
echo ; echo FIN
