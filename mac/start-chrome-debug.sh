#!/usr/bin/env bash

## start chrome with remote debugger on port 9222
set -ex

GCHROME='/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
GCHROMECANARY='/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary'

REMOTEDEBUGGINGPORT="9222"
REMOTEDEBUGGINGPORTARG="--remote-debugging-port=$REMOTEDEBUGGINGPORT"

if [ -e "$GCHROMECANARY" ] # note: need space between arg and square bracket
then
    CMD="$GCHROMECANARY"
elif [ -e "$GCHROME" ]
then
    CMD="$GCHROME"
fi

# run
"$CMD" "$REMOTEDEBUGGINGPORTARG"
