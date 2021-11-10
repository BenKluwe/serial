TEMPLATE = lib

SOURCES += src/serial.cc

INCLUDEPATH += include/

HEADERS += \
	include/serial/serial.h \
	include/serial/v8stdint.h

win32 {
	SOURCES += \
		src/impl/win.cc \
		src/impl/list_ports/list_ports_win.cc
	LIBS += -lsetupapi
}

unix:!macx {
	SOURCES += \
		src/impl/unix.cc \
		src/impl/list_ports/list_ports_linux.cc
	LIBS += -lrt -lpthread
}

macx {
	SOURCES += \
		src/impl/unix.cc \
		src/impl/list_ports/list_ports_osx.cc
	LIBS += -lIOKit -lFoundation
}
