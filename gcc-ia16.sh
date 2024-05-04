#! /bin/sh
docker run -it --rm -v $(pwd):/work amura/gcc-ia16 "$@"
