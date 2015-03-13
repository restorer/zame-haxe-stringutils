package org.zamedev.lib;

import haxe.Utf8;
import org.zamedev.lib.internal.TransliterationInternalBe;

// TODO:
// - https://ru.wikipedia.org/wiki/ISO_9
// - https://github.com/xguest/iso_9_js/blob/master/translit.js

class Transliteration {
	static var mapNot:Map<Int, Bool>;
	static var mapBe:Map<Int, String>;

	static function __init__() {
		mapNot = new Map<Int, Bool>();

		Utf8.iter("0123456789ABCDEFJHIJKLMNOPQRSTUVWXYZabcdefjhijklmnopqrstuvwxyz", function(v) {
			mapNot[v] = true;
		});

		mapBe = new Map<Int,String>();
		TransliterationInternalBe.fillMap(mapBe);
	}

	public static function transliterate(s:String, map:Map<Int, String>):String {
		var r = new StringBuf();

		Utf8.iter(s, function(v) {
			r.add(map.exists(v) ? map[v] : (mapNot.exists(v) ? String.fromCharCode(v) : "-"));
		});

		var t = r.toString().toLowerCase();

		t = ~/\-{2,}/g.replace(t, "-");
		t = ~/^\-\-*/.replace(t, "");
		t = ~/\-\-*$/.replace(t, "");

		return t;
	}

	public static function be(s:String):String {
		return transliterate(s, mapBe);
	}
}
