# Ejercicio Práctico Bash - Introducción al Desarrollo de Software

## Integrantes
- Patricio López; Padrón: 115353
- Karla Torres; Padrón: 114908
- José Toro; Padrón: 115216
- Jhordan Huancaruna; Padrón: 115732 

## Descripción
Script en Bash que permite gestionar un listado de alumnos mediante un menú interactivo.
Opera sobre archivos de texto con el formato: `Nro_Padrón, Nombre y Apellido, Email, Nota`

## Estructura del proyecto
```
TPBash/
├── menu.sh          # script principal
├── consolidar.sh    # script de procesamiento
└── README.md
```

## Requisitos
- Linux o MacOS
- Bash shell

## Variable de ambiente
El script usa la variable `FILENAME` para definir el nombre del archivo de salida.
Si no se define, usa `alumnos` por defecto:
```bash
FILENAME="miarchivo" ./menu.sh   # define el nombre
./menu.sh                         # usa "alumnos" por defecto
```

## Cómo ejecutar

### 1. Clonar el repositorio
```bash
git clone https://github.com/xaviip/TPBash.git
cd TPBash
```

### 2. Dar permisos de ejecución
```bash
chmod +x menu.sh consolidar.sh
```

### 3. Ejecutar
```bash
./menu.sh
```

## Opciones del menú
| Opción | Descripción |
|--------|-------------|
| 1 | Crea el entorno de carpetas en `~/EPNro1` |
| 2 | Inicia el proceso de consolidación en background |
| 3 | Lista alumnos ordenados por padrón |
| 4 | Muestra las 10 notas más altas |
| 5 | Busca un alumno por número de padrón |
| 6 | Salir |

## Parámetro optativo
```bash
./menu.sh -d   # Elimina el entorno creado y mata los procesos en background
```

## Formato de archivos de entrada
Los archivos `.txt` que se coloquen en `~/EPNro1/entrada/` deben respetar el siguiente formato:
```
122332 Juan Lopez jlopez@fi.uba.ar 8
100998 Pedro Valdez pvaldez@fi.uba.ar 5
89032 Carla Simone csimone@fi.uba.ar 7
```
