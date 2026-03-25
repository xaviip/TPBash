#!/bin/bash

# Si no existe FILENAME, asigna uno por defecto
export FILENAME=${FILENAME:-"alumnos"}

ENTORNO=~/EPNro1
SALIDA="$ENTORNO/salida/$FILENAME.txt"

borrar_entorno() {
    echo "Borrando entorno..."
    pkill -f consolidar.sh 2>/dev/null
    rm -rf "$ENTORNO"
    echo "Entorno eliminado."
    exit 0
}

crear_entorno() {
    mkdir -p "$ENTORNO"/{entrada,salida,procesado}
    
    # Copia el script consolidar
    if [ -f "./consolidar.sh" ]; then
        cp consolidar.sh "$ENTORNO/"
        chmod +x "$ENTORNO/consolidar.sh"
        echo "Entorno creado correctamente."
    else
        echo "ERROR: No se encuentra consolidar.sh en esta carpeta."
    fi
}

iniciar_proceso() {
    if [ ! -f "$ENTORNO/consolidar.sh" ]; then
        echo "Debe crear el entorno primero."
        return
    fi

    # Evita procesos duplicados
    pkill -f consolidar.sh 2>/dev/null
    "$ENTORNO/consolidar.sh" &
    echo "Proceso iniciado en segundo plano."
}

listar_alumnos() {
    if [ -f "$SALIDA" ]; then
        sort -n "$SALIDA"
    else
        echo "No existe el archivo de salida."
    fi
}

top_notas() {
    if [ -f "$SALIDA" ]; then
        sort -k5 -nr "$SALIDA" | head -10
    else
        echo "No existe el archivo de salida."
    fi
}

buscar_alumno() {
    if [ ! -f "$SALIDA" ]; then
        echo "No existe el archivo de salida."
        return
    fi

    read -p "Ingrese padrón: " padron
    grep "^$padron" "$SALIDA"
}

# Opción optativa -d
if [ "$1" == "-d" ]; then
    borrar_entorno
fi

salir=0

# MENÚ
while [ $salir -eq 0 ]; do
    echo ""
    echo "========== MENÚ =========="
    echo "1) Crear entorno"
    echo "2) Correr proceso"
    echo "3) Listar alumnos ordenados por padrón"
    echo "4) Top 10 notas"
    echo "5) Buscar por padrón"
    echo "6) Salir"
    echo "=========================="
    
    read -p "Seleccione una opción: " opcion

    case $opcion in
        1) crear_entorno ;;
        2) iniciar_proceso ;;
        3) listar_alumnos ;;
        4) top_notas ;;
        5) buscar_alumno ;;
        6) salir=1 ;;
        *) echo "Opción inválida." ;;
    esac
done

echo "Saliendo..."
