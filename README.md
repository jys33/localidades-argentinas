# localidades-argentinas
Obtener todas las localidades por provincia de la República Argentina recuperado de https://github.com/Wolox/arg-localities.

Instalando cURL para Ubuntu Linux

El procedimiento para instalar cURL en Ubuntu Linux es el siguiente:

Actualiza tus paquetes de ubuntu, ejecuta:

sudo apt update && sudo apt upgrade

Siguiente, instala cURL, ejecuta:

sudo apt install curl

Verifica la instalación de cURL ejecutando el siguiente comando:

curl --version

https://stedolan.github.io/jq/download/

Instalar jq desde la consola linux (esto para formatear la salida en formato json):

sudo apt-get install jq

Por último ejecuta el archivo en la consola de ubuntu:

$ ./arg-localidades.sh
