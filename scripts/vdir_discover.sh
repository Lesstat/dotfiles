#!/bin/bash

source ~/bin/find_dbus_session.sh 
vdirsyncer discover
vdirsyncer metasync
