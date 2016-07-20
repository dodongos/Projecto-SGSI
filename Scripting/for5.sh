#! /bin/bash
# lista todos los ficheros del directorio actual
for x in *
do
  ls -l "$x"
  sleep 1
done
