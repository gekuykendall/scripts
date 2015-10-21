#!/bin/bash
###########################################################################
#title                  :java_all_version.sh
#description    :This script will determine the version(s) of java installed on the system and their installation location.
#author
#date                   :20150121
#version                :1.1
#usage                  :Execute against a system group in Opsware.
#notes                  :
###########################################################################
#
#
JAVA_LOCATION=`find / -name java -exec ls -l {} \; 2>/dev/null | grep "/" | cut -d \/ -f 2- | sed -e 's/^/\//'`;
HOST=`hostname`;

        for LOC in $JAVA_LOCATION; do
                if [ -f $LOC ] && [ -x $LOC ]; then
                        JAVA_VERS=`$LOC -version 2>&1 | head -1`;
                        echo -e $HOST,$LOC,$JAVA_VERS;
                fi
        done
