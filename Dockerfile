FROM lojzik/rpi-debian:jessie

ENV OCAML_VERSION 4.02.3

COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN apt-get update
RUN apt-get --yes install libffi-dev opam git make m4

ENV OPAMYES=1

RUN opam init
RUN opam switch 4.02.3
RUN opam config exec -- opam install ocamlfind ounit

