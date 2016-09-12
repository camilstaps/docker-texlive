FROM debian:jessie

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		wget \
		libswitch-perl && \
	rm -rf /var/lib/apt/lists/*

RUN wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz |\
	tar xz

COPY texlive.profile /

RUN cd install-tl-* && ./install-tl -profile /texlive.profile

RUN rm -rf install-tl-*
