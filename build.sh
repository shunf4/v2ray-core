#!/bin/bash

nogccenv() {
        { BACKUP_IFS="$IFS"; IFS=":"; NEW_PATH="" ; for p in $PATH; do IFS="$BACKUP_IFS" ; [[ -x "$p""/gcc" ]] && LAST_GCC_PATH="$p" ; done ; IFS="$BACKUP_IFS" ; PATH="${LAST_GCC_PATH:+"${LAST_GCC_PATH}"":"}""$PATH" $@ ; }
}

GOOS=linux nogccenv go build -v -o ./v2ray_linux ./main
