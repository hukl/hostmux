# This target creates the manpage from its source file
#
# (1) Create target's directory if it doesn't exist
# (2) create the target $@ from the first prerequisite $<
#     The shell redirection creates the target file before `mandoc` is
#     actually executed. To avoid working further with an empty target file
#     it's removed in case of an error and make exits with an error code.
man/hostmux.1: hostmux.mandoc
	mkdir -p $(dir $@)
	mandoc -I os=sh -Tman $< > $@ || { rm -f $@ ; exit 2 ; }
