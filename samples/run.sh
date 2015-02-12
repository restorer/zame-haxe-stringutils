#!/bin/bash

haxe -lib zame-stringutils -x Utf8ExtSample.hx
[ -e Utf8ExtSample.hx.n ] && rm Utf8ExtSample.hx.n

echo

haxe -lib zame-stringutils -x TransliterationSample.hx
[ -e TransliterationSample.hx.n ] && rm TransliterationSample.hx.n
