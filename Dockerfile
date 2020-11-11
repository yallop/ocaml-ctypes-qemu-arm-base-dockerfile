FROM balenalib/rpi-debian:buster

ENV OCAML_VERSION 4.02.3

COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN apt-get update
RUN apt-get --yes install libffi-dev opam git make m4 mccs
RUN apt-get remove --yes curl

ENV OPAMYES=1

RUN opam init --bare --disable-sandboxing
RUN opam update
RUN opam switch create --solver=mccs 4.02.3
RUN opam config exec -- opam install ocamlfind ounit integers.0.3.0

RUN apt-get update --allow-releaseinfo-change
RUN apt-get --yes install libncurses-dev
