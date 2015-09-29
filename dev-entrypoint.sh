#! /bin/bash

# Agregar los binstubs a $PATH:
export PATH=/usr/src/app/bin:$PATH

set -e

if [ -z "$1" ]; then

  # 1:
  bundle check || bundle

  # 2:
  rake db:migrate || rake db:setup

  # 3:
  set -- rails server -p 3000 -b 0.0.0.0
fi

# ejecutar el comando o el default:
exec "$@"
