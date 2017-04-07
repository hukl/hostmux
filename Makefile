src=hostmux.mandoc
tgt=man/hostmux.1

$(tgt): $(src)
	mkdir -p $(shell dirname $@)
	mandoc -I os=sh -Tman $< > $@ || { rm -f $@ ; exit 2 ; }
