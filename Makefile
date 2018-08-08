# makefile for liblinAlg.a

# (C) Bill Lenhart 
# modified 2003 Tom White

include config.mak

#MAKE = gmake

SRCDIR = src
OBJDIR = obj
BINDIR = bin

OBJSFROM = Point3Dd/Point3Dd.o Point4Dd/Point4Dd.o Transform3Dd/Transform3Dd.o \
	Transform4Dd/Transform4Dd.o \
	Point3Df/Point3Df.o Point4Df/Point4Df.o Transform3Df/Transform3Df.o \
	Transform4Df/Transform4Df.o

CCFILES = $(wildcard $(SRCDIR)/*/*.cc)
OBJS = $(addprefix $(OBJDIR)/,$(notdir $(CCFILES:.cc=.o)))
#($OBJSFROM:$(OBJSFROM):$(SRCDIR)/$(OBJSFROM))

INCLDIRS = -I$(SRCDIR)

#-I.. -I.
#CC = g++

$(OBJS): $(CCFILES)
	$(CC) $(CCFLAGS) -c -o $@ $< $(INCLDIRS)

.cc.o:
	$(CC) $(CCFLAGS) -c -o $@ $< $(INCLDIRS)

#build the library
lib/liblinAlg.a: $(OBJS)
	#Remember to run make install with permissions on $(prefix)

# install the library
$(prefix)/lib/liblinAlg.a : bin/liblinAlg.a 
	cp bin/liblinAlg.a $(prefix)/lib
	cp $(SRCDIR)/*/*.h $(prefix)/include
	ar r $@ $?
	chmod 755 $@
	ranlib $@
	#Remember to make sure $(prefix)/lib is in /etc/ld.so.conf
	#And to run ldconfig as root.

all: config.mak $(OBJS) bin/liblinAlg.a

oall:    config.mak
	cd $(SRCDIR)/Point3Dd ; $(MAKE) Point3Dd.o; cd ..
	cd $(SRCDIR)/Point4Dd ; $(MAKE) Point4Dd.o; cd ..
	cd $(SRCDIR)/Point3Df ; $(MAKE) Point3Df.o; cd ..
	cd $(SRCDIR)/Point4Df ; $(MAKE) Point4Df.o; cd ..
	cd $(SRCDIR)/Transform3Dd ; $(MAKE) Transform3Dd.o; cd ..
	cd $(SRCDIR)/Transform4Dd ; $(MAKE) Transform4Dd.o; cd ..
	cd $(SRCDIR)/Transform3Df ; $(MAKE) Transform3Df.o; cd ..
	cd $(SRCDIR)/Transform4Df ; $(MAKE) Transform4Df.o; cd ..

copyheaders:
	cp $(SRCDIR)/*/*.h $(prefix)/include

mrproper: clean
	rm -f config.h config.mak

clean:	
	rm -rf */*.o






