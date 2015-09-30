#! /bin/bash

set -e

# 1: Agregar los binstubs a $PATH:
export PATH=/usr/src/app/bin:$PATH

# 2: "Esperar" a que termine el setup del otro container de la app:
if [ -z "$APP_SETUP_WAIT" ]; then APP_SETUP_WAIT=5; fi
while [ -f /usr/src/app/tmp/app-setup-is-busy ]
do
  echo "Waiting $APP_SETUP_WAIT seconds for another app container to finish setup..."
  sleep $APP_SETUP_WAIT
done

# 3: "Apartar el proceso de setup:
touch /usr/src/app/tmp/app-setup-is-busy

# 4: Revisar o Instalar dependencias de la app:
bundle check || bundle

# 5: Actualizar o Instalar la base de datos:
rake db:migrate || rake db:setup

# 6: "Liberar" el proceso de setup:
rm -rf /usr/src/app/tmp/app-setup-is-busy

# 7: Especificar el comando default:
if [ -z "$1" ]; then set -- rails server -p 3000 -b 0.0.0.0 "$@"; fi

# 8: Ejecutar el comando o el default:
exec "$@"
