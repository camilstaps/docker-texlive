FROM debian:jessie

COPY texlive.profile /

RUN PACKAGES="wget libswitch-perl" \
	&& apt-get update \
	&& apt-get install -qq $PACKAGES \
	&& wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz |\
		tar xz \
	&& cd install-tl-* \
	&& ./install-tl -profile /texlive.profile \
# Cleanup
	&& rm -rf install-tl-* \
	&& ADDED_PACKAGES=`apt-mark showauto` \
	&& apt-get remove --purge -qq $PACKAGES $ADDED_PACKAGES \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /var/tex
WORKDIR /var/tex
