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
from glob import glob

import khtbma
import pypackager

__build__ = '1'
__author__ = "Benoît HERVIER (khertan)"
__mail__ = "khertan@khertan.net"
__upgrade__ = '''1.0: Initial Public Release
1.1: Better use of harmattan invoker
1.2: Add restore serial capabilities'''

if __name__ == "__main__":
    try:
        os.chdir(os.path.dirname(sys.argv[0]))
    except:
        pass

    p=pypackager.PyPackager("khtbma")
    p.display_name = 'KhtBMA'
    p.version = khtbma.__version__
    p.buildversion = __build__
    p.description="An unofficial Battle.net Authenticator for Nokia n9 and n950 MeeGo Devices. Usefull for having more secure login in some Blizzard Games like World of Warcraft and Diablo III."
    p.upgrade_description=__upgrade__
    p.author=__author__
    p.maintainer=__author__
    p.email=__mail__
    p.depends = "python, python-pyside.qtgui, python-pyside.qtdeclarative, python-pyside.qtcore, python-pyside.qtopengl"
    p.suggests = ""
    p.section="user/games"
    p.arch="armel"
    p.urgency="low"
    p.icon='khtbma_64.png'
    p.distribution="harmattan"
    p.repository="Khertan Repository"
    p.bugtracker = 'http://github.com/khertan/KhtBMA/issues'
    p.changelog =  p.upgrade_description
    p.maemo_flags = 'visible'
    p.meego_desktop_entry_filename = '/usr/share/applications/khtbma.desktop'
    files = []
    p.postinst = '''#!/bin/sh
chmod +x /opt/khtbma/__init__.py'''

    #Src
    #Src
    for root, dirs, fs in os.walk(os.path.join(os.path.dirname(__file__), p.name)):
      for f in fs:
        files.append(os.path.join(root, f))


    p['/usr/share/dbus-1/services'] = ['khtbma.service',]
    p['/usr/share/icons/blanco/80x80/apps'] = ['khtbma.png',]
    p['/usr/share/applications'] = ['khtbma.desktop',]
    p["/opt"] = files

    print p.generate(build_binary=True,build_src=True)
    if not os.path.exists('dists'):
        os.mkdir('dists')
    for filepath in glob(p.name+'_'+p.version+'-'+p.buildversion+'*'):
        os.rename(filepath, os.path.join(os.path.dirname(filepath), 'dists', os.path.basename(filepath)))



