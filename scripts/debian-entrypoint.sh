#!/usr/bin/dumb-init /bin/bash

# If first parameter is not nomad, add to command
if [ "${1}" != 'nomad' ]; then
  set -- nomad ${@}
fi

# Run commands as pack user, unless env is set
if [ -z "${RUN_AS_ROOT}" ]; then
  cd /home/nomad
  set -- gosu nomad ${@}
fi

exec ${@}
