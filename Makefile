# tomato - a simple tomato timer
# See LICENSE file for copyright and license details.

include config.mk

SRC = tomato.c
OBJ = ${SRC:.c=.o}

all: options tomato

options:
	@echo tomato build options:
	@echo "CFLAGS  = ${CFLAGS}"
	@echo "LDFLAGS = ${LDFLAGS}"
	@echo "CC      = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	@echo creating $@ from config.def.h
	@cp config.def.h $@

tomato: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f ${SRC:.c=} ${OBJ} tomato-${VERSION}.tar.xz

dist: clean
	@echo creating dist tarball
	@mkdir -p tomato-${VERSION}
	@cp -R LICENSE Makefile README config.mk config.def.h tomato.info tomato.1 ${SRC} tomato-${VERSION}
	@tar -cf tomato-${VERSION}.tar tomato-${VERSION}
	@xz tomato-${VERSION}.tar
	@rm -rf tomato-${VERSION}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f tomato tomatoc ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/tomato
	@chmod 755 ${DESTDIR}${PREFIX}/bin/tomatoc
	@echo installing manual page to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < tomato.1 > ${DESTDIR}${MANPREFIX}/man1/tomato.1
	@sed "s/VERSION/${VERSION}/g" < tomatoc.1 > ${DESTDIR}${MANPREFIX}/man1/tomatoc.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/tomato.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/tomatoc.1

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/tomato
	@rm -f ${DESTDIR}${PREFIX}/bin/tomatoc
	@echo removing manual page from ${DESTDIR}${MANPREFIX}/man1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/tomato.1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/tomatoc.1

.PHONY: all options clean dist install uninstall
