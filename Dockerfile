FROM debian:stretch

COPY texlive.profile /

RUN INSTALL_PACKAGES="wget libswitch-perl" \
	&& PACKAGES="biber perl-modules" \
	&& apt-get update \
	&& apt-get install -qq $INSTALL_PACKAGES $PACKAGES --no-install-recommends \
	&& wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz |\
		tar xz \
	&& cd install-tl-* \
	&& ./install-tl -profile /texlive.profile \
# Cleanup
	&& rm -rf install-tl-* \
	&& apt-get remove --purge -qq $INSTALL_PACKAGES \
	&& apt-get autoremove --purge -qq \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /var/tex
WORKDIR /var/tex
