PREFIX = $(HOME)
CFLAGS = -Wall -O2 -pipe -I $(PREFIX)/include
LDFLAGS = -Wl,-rpath,$(PREFIX)/lib
LIBS = -L $(PREFIX)/lib -lmidifile
INSTALL = install

BINDIR = $(PREFIX)/bin

MF2TPROG = mf2t
MF2TOBJS = mf2t.o

T2MFPROG = t2mf
T2MFOBJS = t2mf.o t2mflex.o

PROGS = $(MF2TPROG) $(T2MFPROG)
OBJS = $(MF2TOBJS) $(T2MFOBJS)

all: $(PROGS)

$(MF2TPROG): $(MF2TOBJS)
	$(CC) $(LDFLAGS) -o $(MF2TPROG) $(MF2TOBJS) $(LIBS)

$(T2MFPROG): $(T2MFOBJS)
	$(CC) $(LDFLAGS) -o $(T2MFPROG) $(T2MFOBJS) $(LIBS)

#t2mflex.c: t2mf.fl
#	flex -i -s -Ce -8 t2mf.fl
#	mv lex.yy.c t2mflex.c

install: $(PROGS)
	$(INSTALL) -d $(BINDIR)
	$(INSTALL) -m 755 -s $(PROGS) $(BINDIR)

clean:
	rm -f $(PROGS) $(OBJS)
