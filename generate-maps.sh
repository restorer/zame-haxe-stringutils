#!/bin/bash

cd $(dirname "$0")

cleanup () {
    [ -L haxe_libraries ] && rm haxe_libraries
    [ -L .haxerc ] && rm .haxerc
}

setup_lix () {
    cleanup

    ln -s "test/lix-$1/haxe_libraries" haxe_libraries
    ln -s "test/lix-$1/.haxerc" .haxerc
}

setup_lix haxe4
haxe -lib zame-miscutils -cp ./test -main internal.EthalonCaseMapsGenerator --interp
haxe -lib zame-miscutils -cp . -main org.zamedev.lib.internal.CaseMapsGenerator --interp
cleanup
