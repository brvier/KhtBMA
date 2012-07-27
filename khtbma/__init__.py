#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Copyright (c) 2011 Benoit HERVIER <khertan@khertan.net>
# Licenced under GPLv3

## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published
## by the Free Software Foundation; version 3 only.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

from PySide.QtGui import QApplication
from PySide.QtCore import QUrl, Slot, QObject, Property, Signal, QSettings
from PySide import QtDeclarative
from PySide.QtOpenGL import QGLWidget
from binascii import hexlify, unhexlify

import sys
import os
import os.path

import bna

__author__ = 'Benoit HERVIER (Khertan)'
__email__ = 'khertan@khertan.net'
__version__ = '1.1.0'

class Authenticator(QObject):

    ''' A class for manipulating tocken'''
    def __init__(self, ):
        QObject.__init__(self)
        self._settings = QSettings()
        self._token = ''
        self._timeremaining = ''
        self._serial = ''

        if self._settings.contains('REGION'):
            self._region = self._settings.value('REGION')
            if self._region not in ('EU', 'US'):
                self._set_region('US')
        else:
            self._region = 'US'

        if self._settings.contains('SECRET'):
            self._secret = unhexlify(self._settings.value('SECRET'))
            if not self._secret:
                self.new_serial()
        else:
            self.new_serial()

        if not self._serial:
            if self._settings.contains('SERIAL'):
                self._serial = self._settings.value('SERIAL')

        if self._token == '':
            self.sync()

    @Slot()
    def new_serial(self):
        try:
            authenticator = bna.requestNewSerial(self._region)
            self._secret = authenticator["secret"]
            self._set_serial(authenticator["serial"])
            self._settings.setValue("SECRET", hexlify(self._secret).decode("ascii"))
            self._settings.setValue("SERIAL", self._serial)
            self.sync()
        except Exception, e:
            self.on_error.emit("Could not connect: %s" % (unicode(e)))

    @Slot()
    def sync(self):
        try:
            token, self._timeremaining = bna.getToken(secret=self._secret)
            self._token = unicode(token)
            self.on_tokenChanged.emit()
            self.on_timeremainingChanged.emit()
        except Exception, e:
            self.on_error.emit("Could not connect: %s" % (unicode(e)))

    def _get_region(self):
        return self._region
    def _set_region(self, region):
        self._region = region
        self._settings.setValue("REGION", self._region)
        self.on_regionChanged.emit()
    def _get_serial(self):
        return self._serial
    def _set_serial(self, serial):
        self._serial = serial
        self._settings.setValue("SERIAL", self._serial)
        self.on_serialChanged.emit()

    def _get_token(self):
        return self._token
    def _get_timeremaining(self):
        return self._timeremaining

    on_tokenChanged = Signal()
    on_timeremainingChanged = Signal()

    on_serialChanged = Signal()
    on_regionChanged = Signal()
    serial = Property(unicode, _get_serial, _set_serial, notify=on_serialChanged)
    region = Property(unicode, _get_region, _set_region, notify=on_regionChanged)
    token = Property(unicode, _get_token, notify=on_tokenChanged)
    timeremaining = Property(int, _get_timeremaining, notify=on_timeremainingChanged)
    on_error = Signal(unicode)

class KhtBMA(QApplication):
    ''' Application class '''
    def __init__(self):
        QApplication.__init__(self, sys.argv)
        self.setOrganizationName("Khertan Software")
        self.setOrganizationDomain("khertan.net")
        self.setApplicationName("KhtBMA")

        self.view = QtDeclarative.QDeclarativeView()
        self.glw = QGLWidget()
        self.view.setViewport(self.glw)
        self.auth = Authenticator()
        self.rootContext = self.view.rootContext()
        self.rootContext.setContextProperty("argv", sys.argv)
        self.rootContext.setContextProperty("__version__", __version__)
        self.rootContext.setContextProperty('Authenticator',self.auth)
        self.view.setSource(QUrl.fromLocalFile(
                os.path.join(os.path.dirname(__file__), 'qml',  'main.qml')))
        self.rootObject = self.view.rootObject()
        self.auth.on_error.connect(self.rootObject.onError)
        self.view.showFullScreen()

if __name__ == '__main__':
    sys.exit(KhtBMA().exec_())
