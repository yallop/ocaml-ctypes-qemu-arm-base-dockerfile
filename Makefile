all:
	ls qemu-arm-static || cp /usr/bin/qemu-arm-static  .
	docker build -t yallop/ocaml-ctypes-qemu-arm-base .
