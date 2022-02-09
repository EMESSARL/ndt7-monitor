#!/bin/bash
echo "Automatic Test on TCP"
date
ndt7-client -server monitor.uac.bj:4444
ndt7-client -server emes.bj:4444
quic-client -url emes.bj:4447
quic-client -url monitor.uac.bj:4447

