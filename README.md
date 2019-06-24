# docker-texlive

Dockerfiles for [TeX Live](https://tug.org/texlive/).

## Available tags

- `standard`: A standard release containing many popular packages and tools.
- `minimal`: The infrastructure only, packages can be installed using `tlmgr`.

## How to use

Simply run `pdflatex` or another program (`latexmk` is available too):

```
docker run -v /my/.../directory:/var/tex camilstaps/texlive pdflatex doc.tex
```

## Source code

[github.com/camilstaps/docker-texlive](https://github.com/camilstaps/docker-texlive)

## Docker Hub

[hub.docker.com/r/camilstaps/texlive](https://hub.docker.com/r/camilstaps/texlive)
