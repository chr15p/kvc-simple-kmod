ifndef DESTDIR
DESTDIR=/usr/
endif
ifndef CONFDIR
CONFDIR=/etc
endif
ifndef MODNAME
MODNAME=simple-kmod
KMOD_NAMES="simple-kmod simple-procfs-kmod"
endif

ifndef KMOD_NAMES
KMOD_NAMES=$(MODNAME)
endif

install:
	install -v -m 644 simple-kmod-lib.sh $(DESTDIR)/lib/kvc/$(MODNAME)-lib.sh
	install -v -m 644 simple-kmod.conf $(CONFDIR)/kvc/$(MODNAME).conf
	install -v -m 755 simple-kmod-wrapper.sh $(DESTDIR)/lib/kvc/$(MODNAME)-wrapper.sh
	ln -sf ../lib/kvc/simple-kmod-wrapper.sh $(DESTDIR)/bin/spkut
	sed -i 's/^KMOD_NAMES=.*/KMOD_NAMES=$(KMOD_NAMES)/' $(CONFDIR)/kvc/$(MODNAME).conf
