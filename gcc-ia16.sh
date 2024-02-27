#! /bin/sh
docker run -it --rm -v $(PWD):/work amura/gcc-ia16 "$@"
