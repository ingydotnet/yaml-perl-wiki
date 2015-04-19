ALL := $(shell for f in *; do readlink $$f 2>/dev/null; done)
ALL_POD := $(ALL:.wiki/%.swim=.pod/%.pod)


all: $(ALL_POD) ReadMe.pod

.pod/%.pod: .wiki/%.swim
	swim --to=pod --complete --wrap $< > $@

ReadMe.pod: HomePage
	swim --to=pod --complete --wrap $< > $@
