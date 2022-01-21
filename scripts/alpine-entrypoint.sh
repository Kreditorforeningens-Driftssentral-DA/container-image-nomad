#!/usr/bin/dumb-init /bin/ash

# If first parameter is not nomad, add to command
if [ "${1}" != 'nomad' ]; then
  set -- nomad ${@}
fi

# Run commands as unprivileged user, unless env is set
if [ -z "${RUN_AS_ROOT}" ]; then
  cd /home/nomad
  set -- su-exec nomad ${@}
fi

exec ${@}
