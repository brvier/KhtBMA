#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Copyright (c) 2011 Benoît HERVIER <khertan@khertan.net>
# Licenced under GPLv3

## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published
## by the Free Software Foundation; version 3 only.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

import os
import sys
import shutil
import time
import string
from glob import glob
from datetime import datetime
import socket

import khtbma
import pypackager

__build__ = '1'
__author__ = "Benoît HERVIER (khertan)"
__mail__ = "khertan@khertan.net"
__upgrade__ = '''First public release'''

if __name__ == "__main__":
    try:
        os.chdir(os.path.dirname(sys.argv[0]))
    except:
        pass

    p=pypackager.PyPackager("khtbma")
    p.display_name = 'KhtBMA'
    p.version = khtnotes.__version__
    p.buildversion = __build__
    p.description="An unofficial Battle.net Authenticator for Nokia n9 and n950 MeeGo Devices. Usefull for having more secure login in some Blizzard Games like World of Warcraft and Diablo III."
    p.upgrade_description=__upgrade__
    p.author=__author__
    p.maintainer=__author__    
    p.email=__mail__
    p.depends = "python, python-pyside.qtgui, python-pyside.qtdeclarative, python-pyside.qtcore, python-pyside.qtopengl"
    p.suggests = ""
    p.section="user/security"
    p.arch="armel"
    p.urgency="low"
    p.icon='khtbma.png'
    p.distribution="harmattan"
    p.repository="Khertan Repository"
    p.bugtracker = 'http://github.com/khertan/KhtBMA/issues'
    p.changelog =  p.upgrade_description
    p.maemo_flags = 'visible'
    p.meego_desktop_entry_filename = '/usr/share/applications/khtbma.desktop'
    files = []
    p.postinst = """"""

    #Src
    srcpath = '/home/user/MyDocs/Projects/KhtBMA/khtbma'
    for root, dirs, fs in os.walk(srcpath):
      for f in fs:
        prefix = os.path.relpath(os.path.join(root,f),(os.path.dirname(srcpath)))
        print root, prefix
        files.append(prefix)

    p['/usr/share/dbus-1/services'] = ['khtbma.service',]
    p['/usr/share/icons/blanco/80x80/apps'] = ['khtbma.png',]
    p['/usr/share/applications'] = ['khtbma.desktop',]
    p["/opt"] = files
    
    print p.generate(build_binary=True,build_src=False)
    print p.generate(build_binary=False,build_src=True)    
