package org.zamedev.lib;

import org.zamedev.lib.internal.TransliterationInternalBe;
import org.zamedev.lib.internal.TransliterationInternalRu;

#if (haxe_ver < "4.0.0")
    import haxe.Utf8;
#elseif neko
    import neko.Utf8;
#end

class Transliteration {
    public static var mapNot : Map<Int, Bool>;
    public static var mapBe : Map<Int, String>;
    public static var mapRu : Map<Int, String>;

    static function __init__() {
        mapNot = new Map<Int, Bool>();

        #if ((haxe_ver < "4.0.0") || neko)
            Utf8.iter("0123456789ABCDEFJHIJKLMNOPQRSTUVWXYZabcdefjhijklmnopqrstuvwxyz", function(v : Int) : Void {
                mapNot[v] = true;
            });
        #else
            for (v in ("0123456789ABCDEFJHIJKLMNOPQRSTUVWXYZabcdefjhijklmnopqrstuvwxyz" : UnicodeString)) {
                mapNot[v] = true;
            }
        #end

        mapBe = new Map<Int, String>();
        TransliterationInternalBe.fillMap(mapBe);

        mapRu = new Map<Int, String>();
        TransliterationInternalRu.fillMap(mapRu);
    }

    public static function transliterate(s : String, map : Map<Int, String>) : String {
        var r = new StringBuf();

        #if ((haxe_ver < "4.0.0") || neko)
            Utf8.iter(s, function(v : Int) : Void {
                r.add(map.exists(v) ? map[v] : (mapNot.exists(v) ? String.fromCharCode(v) : "-"));
            });
        #else
            for (v in (s : UnicodeString)) {
                r.add(map.exists(v) ? map[v] : (mapNot.exists(v) ? String.fromCharCode(v) : "-"));
            }
        #end

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
