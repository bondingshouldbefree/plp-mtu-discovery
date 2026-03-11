CC = gcc
CFLAGS := $(CFLAGS) -O2 -Wall

ifeq ($(DEBUG),1)
	CFLAGS += -g
endif

SRCS = mtu.c mtu_discovery.c

all: plpmtu
.PHONY: all

plpmtu: $(SRCS) mtu.h
	$(CC) $(CFLAGS) -o $@ $(SRCS)

install: plpmtu
	install -D plpmtu $(DESTDIR)/usr/local/sbin/plpmtu
	install -D udp_server.py $(DESTDIR)/usr/local/sbin/plpmtu-udp-server
.PHONY: install

uninstall:
	rm -f $(DESTDIR)/usr/local/sbin/plpmtu
	rm -f $(DESTDIR)/usr/local/sbin/plpmtu-udp-server
.PHONY: uninstall

clean:
	rm -f plpmtu
