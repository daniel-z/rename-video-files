Rename Video Files
==================

# Descripcion
Este es un projecto útil solo para mi y mis hermanos de la Iglesia Obra de Guadalajara, esta es una utilidad para renombrar grandes cantidades de videos que provienen de nuestras camaras.

# Contexto
El nombre de los archivos es generado por la camara como MOVXXX.MOD donde XXX es un numero en hexadecimal. el orden se genera de la siguiente manera generando confusion para los usuarios que no conocen el hexadecimal:

MOV001.MOD es el numero 1
...
MOV008.MOD es el numero 8
MOV009.MOD es el numero 9
MOV00A.MOD es el numero 10
MOV00B.MOD es el numero 11
...
MOV010.MOD es el numero 16,
MOV011.MOD es el numero 17,
etc,etc.

## Prerequisitos

1. Es necesario tener instalado Ruby: http://net.tutsplus.com/tutorials/ruby/how-to-install-ruby-on-a-mac/

## Instalacion
Una vez instalado hay que descargar e instalar la gema mas actualizada de este proyecto: 
    1 Descarga https://github.com/daniel-z/rename-video-files/downloads
    1 Ejecuta desde la linea de comandos:
        # gem install renaming-0.1.0.gem

# Uso

1. Entra a la carpeta que contiene los archivos de video. 
estructura ejemplo:

2012-10-10-VIDEOS:
    Carpeta1:
        MOV001.MOD
        MOV002.MOD
        MOV003.MOD
    Carpeta2
        MOV001.MOD
        MOV002.MOD
        MOV003.MOD

2. Ejecuta la utileria:
    desde la linea de comandos:
        # renaming

La libreria va a leer los directorios en orden primero "Carpeta1" despues "Carpeta2", de igual manera con los archivos y va a renombrarlos y retornar el siguiente resultado:

2012-10-10-VIDEOS:
    MOV001.mpg
    MOV002.mpg
    MOV003.mpg
    MOV004.mpg
    MOV005.mpg
    MOV006.mpg
    Carpeta1:
        (vacia)
    Carpeta2:
        (vacia)

