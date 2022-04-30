# vim: list:ts=4:

FROM ubuntu:focal

ARG version=0.21.1
ARG DEBIAN_FRONTEND=noninteractive

RUN --mount=type=cache,sharing=private,target=/var/cache/apt \
	--mount=type=cache,sharing=private,target=/var/lib/apt \
	apt update && apt install -y --no-install-recommends curl ca-certificates python3

RUN curl -sL https://github.com/arduino/arduino-cli/releases/download/${version}/arduino-cli_${version}_Linux_64bit.tar.gz \
	| tar xz arduino-cli -C /

RUN /arduino-cli config init
RUN /arduino-cli config add board_manager.additional_urls https://arduino.esp8266.com/stable/package_esp8266com_index.json
RUN /arduino-cli core install esp8266:esp8266

ENTRYPOINT ["/arduino-cli"]
