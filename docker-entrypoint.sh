#!/bin/bash

# start VNC server in background
bash /dockerstartup/vnc_startup.sh > /dev/null 2>&1 &

# invoke archimate CLI with arguments from "outside" the docker container
bash /headless/Desktop/Archi/Archi-Ubuntu.sh -application com.archimatetool.commandline.app -consoleLog -nosplash "$@"
