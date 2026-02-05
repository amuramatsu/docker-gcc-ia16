FROM --platform=linux/amd64 ubuntu:jammy

LABEL maintainer="MURAMATSU Atsushi <amura@tomato.sakura.ne.jp>"

WORKDIR /work
ENV INFOPATH=/usr/ia16-elf/info:/usr/share/info
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
		software-properties-common install-info \
	&& add-apt-repository ppa:tkchia/build-ia16 \
	&& apt-get update \
	&& apt-get install -y \
		gcc-ia16-elf jwasm jwlink make info \
	&& cd /usr/ia16-elf/info \
	&& for file in *; do install-info $file dir; done \
	&& apt-get purge -y \
		software-properties-common \
	&& apt-get autoremove -y --purge && rm -rf /var/cache/apt

CMD [ "/bin/bash" ]

# docker build -t amura/gcc-ia16 .
