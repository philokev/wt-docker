FROM alpine:latest

RUN apk update && apk upgrade && apk add \
	boost-dev \
	build-base \
	cmake \
	curl

RUN curl -sSL https://github.com/emweb/wt/archive/4.3.1.tar.gz \
	| tar -xz -C /tmp \
	&& cd /tmp/wt-4.3.1 \
	&& mkdir build \
	&& cd build \
	&& cmake ../ \
	&& make -j8 \
	&& make install \
	&& cd / \
	&& rm -rf /tmp/wt-4.3.1

