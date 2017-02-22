src=hostmux.mandoc
tgt=man/hostmux.1

$(tgt): $(src)
	mkdir -p $(shell dirname $(tgt))
	mandoc -Tman $(src) > $(tgt)
