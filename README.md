# container-image-nomad
[![Build (Docker)](https://github.com/Kreditorforeningens-Driftssentral-DA/container-image-nomad/actions/workflows/docker-build.yml/badge.svg)](https://github.com/Kreditorforeningens-Driftssentral-DA/container-image-nomad/actions/workflows/docker-build.yml)

  * Pull image from [GitHub](https://hub.docker.com/repository/docker/kdsda/nomad).
  * Pull image from [Docker Hub](https://hub.docker.com/repository/docker/kdsda/nomad).
  * Source on [GitHub](https://github.com/Kreditorforeningens-Driftssentral-DA/container-image-nomad).
  * HashiCorp Nomad on [GitHub](https://github.com/hashicorp/nomad).

```bash
# Start a development instance locally
docker run --rm -it -p 4646:4646 kdsda/nomad:alpine-1.5.6 agent -dev -bind 0.0.0.0
```

# IMAGES

Monthly builds. Use "<YEAR.WEEK>" tag for pinning image version.

| IMAGE | SIZE | SIZE (uncompressed) |
| :-- | :-: | :-: |
| SCRATCH | ~30MB | ~80MB |
| ALPINE | ~40MB | ~100MB |
| DEBIAN | ~70MB | ~170MB |

NOTE:
  * Alpine images are built from source.
  * Scratch images are built from source (statically linked).
  * Debian images use HashiCorp official binaries.


#### ENVIRONMENT VARIABLES

| VARIABLE | DEFAULT | DESCRIPTION |
| :-- | :-: | :-- |
| NOMAD_ADDR | http://127.0.0.1:4646  | Target Nomad API-server |
| NOMAD_TOKEN | (Unset) | Nomad token to pass for authentication |


## EXAMPLES

#### Using docker cli
```bash
# Default (print version).
docker run --rm -it kdsda/nomad:scratch-1.2.4
docker run --rm -it kdsda/nomad:alpine-1.2.4
docker run --rm -it kdsda/nomad:debian-1.2.4

# Set as alias
alias nomad="docker run --rm -it -e NOMAD_ADDR=https://example.nomad.com:4646 kdsda/nomad:scratch-1.2.4"
nomad node status
nomad job status
unalias nomad

# List jobs
docker run --rm -it -e NOMAD_ADDR=https://example.nomad.com:4646 kdsda/nomad:scratch-1.2.4 job status --namespace=default
```

