PREFIX  ?= $(HOME)/.local
BINDIR  ?= $(PREFIX)/bin
LIBDIR  ?= $(PREFIX)/lib

CC      ?= gcc
CFLAGS  ?= -O2 -Wall

.PHONY: all install uninstall clean

all: fakeuid.so

fakeuid.so: fakeuid.c
	$(CC) $(CFLAGS) -shared -nostartfiles -o $@ $<

install: fakeuid.so
	install -d $(BINDIR) $(LIBDIR)
	install -m 755 suclaude.sh $(BINDIR)/suclaude
	install -m 755 fakeuid.so $(LIBDIR)/fakeuid.so

uninstall:
	rm -f $(BINDIR)/suclaude $(LIBDIR)/fakeuid.so

clean:
	rm -f fakeuid.so
