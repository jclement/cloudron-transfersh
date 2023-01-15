#!/bin/bash

set -eu

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app/data

if [[ ! -f /app/data/env.production ]]; then
    echo "==> Copying env template on first run"
    cp /app/code/env.template /app/data/env.production
fi

echo "Starting Transfersh"

export PROVIDER=local
export BASEDIR=/app/data/files
export LISTENER=0.0.0.0:80

set -a
source /app/data/env.production
set +a

# run the app as user 'cloudron'
exec /usr/local/bin/gosu cloudron:cloudron /app/code/transfersh 

