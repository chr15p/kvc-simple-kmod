KMOD_NAME=cachedump

ifndef DESTDIR
DESTDIR=/usr/
endif

ifndef CONFDIR
CONFDIR=/etc
endif

install:
	install -v -m 644 $(KMOD_NAME)-lib.sh $(DESTDIR)/lib/kvc/
	install -v -m 644 $(KMOD_NAME).conf $(CONFDIR)/kvc/
	install -v -m 755 $(KMOD_NAME)-wrapper.sh $(DESTDIR)/lib/kvc/
	ln -sf ../lib/kvc/$(KMOD_NAME)-wrapper.sh $(DESTDIR)/bin/spkut
