FROM debian:stretch

COPY texlive.profile /
 
RUN INSTALL_PACKAGES="libswitch-perl" \
	&& PACKAGES="libfontconfig1 perl-modules wget" \
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

ENV PATH "/usr/local/texlive/bin/x86_64-linux:${PATH}"
RUN mkdir /var/tex
WORKDIR /var/tex
