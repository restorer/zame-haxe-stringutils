package org.zamedev.lib.tools;

import haxe.Utf8;
import neko.Lib;

/**
 * Map generator for Utf8ExtInternal
 * Can generate from ftp://ftp.unicode.org/Public/UNIDATA/CaseFolding.txt
 * Simple case folding (C + S), only CAPITAL
 *
 * Actually CaseFolding.txt is only right for upper to lower,
 * in case of lower to upper, it's WRONG to use this file.
 *
 * ftp://ftp.unicode.org/Public/UNIDATA/UnicodeData.txt should be used instead.
 * ftp://ftp.unicode.org/Public/3.2-Update/UnicodeData-3.2.0.html
 *
 * Also see https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_71/nls/rbagsucslevel1maptble.htm
 */
class CaseMapsGenerator {
    static function main() {
        var buf = new StringBuf();

        buf.add("package org.zamedev.lib.internal;\n");
        buf.add("\n");
        buf.add("// Use tools/CaseMapsGenerator.hx to generate this file\n");
        buf.add("class Utf8ExtInternal {\n");
        buf.add("\tpublic static function fillUpperToLowerMap(map:Map<Int, Int>):Void {\n");

        var fi = sys.io.File.read("CaseFolding.txt", true);
        var existing = new Map<String, Bool>();

        while (true) {
            var line:String;

            try {
                line = fi.readLine();
            } catch (ex:haxe.io.Eof) {
                break;
            }

            var re = ~/^([0-9A-Z]+); [CS]; ([0-9A-Z]+); # (.+)$/;

            if (re.match(line)) {
                if (existing.exists(re.matched(1))) {
                    Lib.println("fillUpperToLowerMap : already existing mapping for " + re.matched(1));
                    continue;
                } else {
                    existing.set(re.matched(1), true);
                }

                buf.add("\t\tmap[0x" + re.matched(1) + "] = 0x" + re.matched(2) + "; // ");

                var r = new Utf8();
                r.addChar(Std.parseInt("0x" + re.matched(1)));
                buf.add(r.toString());

                buf.add(" --> ");

                var r = new Utf8();
                r.addChar(Std.parseInt("0x" + re.matched(2)));
                buf.add(r.toString());

                buf.add(" (" + re.matched(3) + ")\n");
            }
        }

        fi.close();

        buf.add("\t}\n");
        buf.add("\n");
        buf.add("\tpublic static function fillLowerToUpperMap(map:Map<Int, Int>):Void {\n");

        var fi = sys.io.File.read("CaseFolding.txt", true);

        while (true) {
            var line:String;

            try {
                line = fi.readLine();
            } catch (ex:haxe.io.Eof) {
                break;
            }

            var re = ~/^([0-9A-Z]+); [CS]; ([0-9A-Z]+); # (.+)$/;

            if (re.match(line)) {
                if (existing.exists(re.matched(2))) {
                    Lib.println("fillLowerToUpperMap : already existing mapping for " + re.matched(2));
                    continue;
                } else {
                    existing.set(re.matched(2), true);
                }

                buf.add("\t\tmap[0x" + re.matched(2) + "] = 0x" + re.matched(1) + "; // ");

                var r = new Utf8();
                r.addChar(Std.parseInt("0x" + re.matched(2)));
                buf.add(r.toString());

                buf.add(" --> ");

                var r = new Utf8();
                r.addChar(Std.parseInt("0x" + re.matched(1)));
                buf.add(r.toString());

                buf.add(" (" + re.matched(3) + ")\n");
            }
        }

        fi.close();

        buf.add("\t}\n");
        buf.add("}\n");

        var fo = sys.io.File.write("Utf8ExtInternal.hx", true);
        fo.writeString(buf.toString());
        fo.close();
    }
}
