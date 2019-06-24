FROM camilstaps/texlive:minimal

RUN PACKAGES="biber perl-modules" \
	&& apt-get update \
	&& apt-get install -qq $PACKAGES --no-install-recommends \
	&& tlmgr install scheme-full \
# Cleanup
	&& rm -rf /var/lib/apt/lists/*
