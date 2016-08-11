all: man

man: hostmux.mandoc
	mkdir -p man
	mandoc hostmux.mandoc -Ios= -Tman > man/hostmux.1
