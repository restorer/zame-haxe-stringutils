package ;

import org.zamedev.lib.Utf8Ext;

class Utf8ExtSample {
    public static function main() {
        var s = "This is thE test. Привет! Миру миР!";

        trace(s);

        trace(s.toLowerCase());
        trace(s.toUpperCase());

        trace(Utf8Ext.toLowerCase(s));
        trace(Utf8Ext.toUpperCase(s));

        trace(Utf8Ext.getUnicodeRe().replace(s, "-"));
        trace(Utf8Ext.getUnicodeRe("^").replace(s, "-"));

        trace(Utf8Ext.toLowerCase("日本語"));
        trace(Utf8Ext.toUpperCase("日本語"));

        /*
        trace(haxe.Utf8.charCodeAt("🍺", 0));

        var us = new haxe.Utf8();
        us.addChar(0x1f37b);
        trace(us.toString());
        */
    }
}
