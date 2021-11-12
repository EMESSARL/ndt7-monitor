#!/bin/bash
echo "Automatic Test on TCP"
date
ndt7-client -server monitor.uac.bj:4444
ndt7-client -server emes.bj:4444
