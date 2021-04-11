CFLAGS = -Wall -O2 -pipe -fPIC -fvisibility=hidden -DBUILDING_MIDIFILE
LDFLAGS =
LIBS =
INSTALL = install
PREFIX = $(HOME)

LIBDIR = $(PREFIX)/lib
INCDIR = $(PREFIX)/include
MANDIR = $(PREFIX)/share/man

MAJOR = 1
MINOR = 0

# Linux
#LIB = libmidifile.so
#VERSIONED_LIB = $(LIB).$(MAJOR).$(MINOR)
# MacOS
LIB = libmidifile.dylib
VERSIONED_LIB = $(LIB)

OBJS = midifile.o
INCLUDES = midifile.h
MAN3 = midifile.3

$(VERSIONED_LIB): $(OBJS)
	gcc $(LDFLAGS) -shared -Wl -o $(VERSIONED_LIB) \
		$(OBJS) $(LIBS)

install: $(VERSIONED_LIB)
	$(INSTALL) -d $(LIBDIR)
	$(INSTALL) -m 644 $(VERSIONED_LIB) $(LIBDIR)
#	ln -sf $(LIBDIR)/$(VERSIONED_LIB) $(LIBDIR)/$(LIB).$(MAJOR)
#	ln -sf $(LIBDIR)/$(LIB).$(MAJOR) $(LIBDIR)/$(LIB)
	$(INSTALL) -d $(INCDIR)
	$(INSTALL) -m 644 $(INCLUDES) $(INCDIR)

install-man: $(MAN3)
	$(INSTALL) -d $(MANDIR)/man3
	$(INSTALL) -m 644 $(MAN3) $(MANDIR)/man3

clean:
	rm -f $(VERSIONED_LIB) $(OBJS)
