win32 {
	msvc {
		contains(QT_ARCH, x86_64) {
			CONFIG(release, debug|release): LIBS += -L$$PWD/msvc64/ -lQtUtils
			else:CONFIG(debug, debug|release): LIBS += -L$$PWD/msvc64/ -lQtUtilsd
		} else {
			CONFIG(release, debug|release): LIBS += -L$$PWD/msvc/ -lQtUtils
			else:CONFIG(debug, debug|release): LIBS += -L$$PWD/msvc/ -lQtUtilsd
		}
	} else:win32-g++ {
		CONFIG(release, debug|release): LIBS += -L$$PWD/mingw/ -lQtUtils
		else:CONFIG(debug, debug|release): LIBS += -L$$PWD/mingw/ -lQtUtilsd
	}
} else:mac:contains(QT_ARCH, x86_64) {
	CONFIG(release, debug|release): LIBS += -F$$PWD/clang64/ -lQtUtils
	else:CONFIG(debug, debug|release): LIBS += -F$$PWD/clang64/ -lQtUtils_debug
} else:unix:!mac:contains(QT_ARCH, x86_64) {
	CONFIG(release, debug|release): LIBS += -L$$PWD/gcc64/release/ -lQtUtils
	else:CONFIG(debug, debug|release): LIBS += -L$$PWD/gcc64/debug/ -lQtUtils
}

INCLUDEPATH += $$PWD/include
DEPENDPATH += $$PWD/include
