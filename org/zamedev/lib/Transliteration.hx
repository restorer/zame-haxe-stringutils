package org.zamedev.lib;

import haxe.Utf8;
import org.zamedev.lib.internal.TransliterationInternalBe;
import org.zamedev.lib.internal.TransliterationInternalRu;

class Transliteration {
	public static var mapNot : Map<Int, Bool>;
	public static var mapBe : Map<Int, String>;
	public static var mapRu : Map<Int, String>;

	static function __init__() {
		mapNot = new Map<Int, Bool>();

		Utf8.iter("0123456789ABCDEFJHIJKLMNOPQRSTUVWXYZabcdefjhijklmnopqrstuvwxyz", function(v : Int) : Void {
			mapNot[v] = true;
		});

		mapBe = new Map<Int, String>();
		TransliterationInternalBe.fillMap(mapBe);

		mapRu = new Map<Int, String>();
		TransliterationInternalRu.fillMap(mapRu);
	}

	public static function transliterate(s : String, map : Map<Int, String>) : String {
		var r = new StringBuf();

		Utf8.iter(s, function(v : Int) : Void {
			r.add(map.exists(v) ? map[v] : (mapNot.exists(v) ? String.fromCharCode(v) : "-"));
		});

		var t = r.toString().toLowerCase();

		t = ~/\-{2,}/g.replace(t, "-");
		t = ~/^\-\-*/.replace(t, "");
		t = ~/\-\-*$/.replace(t, "");

		return t;
	}

	public static function be(s : String) : String {
		return transliterate(s, mapBe);
	}

	public static function ru(s : String) : String {
		return transliterate(s, mapRu);
	}
}
