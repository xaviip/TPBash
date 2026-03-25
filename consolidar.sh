#!/bin/bash

ENTORNO=~/EPNro1
ENTRADA="$ENTORNO/entrada"
SALIDA="$ENTORNO/salida/$FILENAME.txt"
PROCESADO="$ENTORNO/procesado"

while [ -d "$ENTRADA" ]; do
    for archivo in "$ENTRADA"/*.txt; do
        if [ -f "$archivo" ]; then
            cat "$archivo" >> "$SALIDA"
            mv "$archivo" "$PROCESADO/"
        fi
    done
    sleep 5
done
