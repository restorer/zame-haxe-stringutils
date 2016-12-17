package org.zamedev.lib.tools;

import haxe.Utf8;
import haxe.io.Eof;
import haxe.io.Path;
import neko.Lib;
import sys.io.File;

/**
 * Map generator for Utf8ExtInternal
 * Can generate from ftp://ftp.unicode.org/Public/UNIDATA/UnicodeData.txt
 *
 * Reference - ftp://ftp.unicode.org/Public/3.2-Update/UnicodeData-3.2.0.html
 */
class CaseMapsGenerator {
    private static inline var IDX_CODE_POINT : Int = 0;
    private static inline var IDX_CHARACTER_NAME : Int = 1;
    private static inline var IDX_GENERAL_CATEGORY : Int = 2;
    // Canonical Combining Classes = 3
    // Bidirectional Category = 4
    // Character Decomposition Mapping = 5
    // Decimal digit value = 6
    // Digit value = 7
    // Numeric value = 8
    // Mirrored = 9
    // Unicode 1.0 Name = 10
    // 10646 comment field = 11
    private static inline var IDX_UPPERCASE_MAPPING : Int = 12;
    private static inline var IDX_LOWERCASE_MAPPING : Int = 13;
    // Titlecase Mapping = 14
    private static inline var IDX_LAST : Int = 15;

    macro private static function resolveThisPath() {
        return macro $v{ haxe.macro.Context.resolvePath("org/zamedev/lib/tools/CaseMapsGenerator.hx") };
    }

    private static function resolveInternalDir() : String {
        return Path.directory(resolveThisPath()) + "/../internal";
    }

    private static function appendMapperFunc(sb : StringBuf, funcName : String, generalCategory : String, mappingIdx : Int) : Void {
        Lib.println('Generating ${funcName}...');

        var fi = File.read("additional/UnicodeData.txt", true);
        var existing = new Map<String, Bool>();

        sb.add('\tpublic static function ${funcName}(map : Map<Int, Int>) : Void {\n');

        while (true) {
            var row : Array<String>;

            try {
                row = fi.readLine().split(";");
            } catch (ex : Eof) {
                break;
            }

            if (row.length < IDX_LAST || row[IDX_GENERAL_CATEGORY] != generalCategory || row[mappingIdx] == "") {
                continue;
            }

            if (existing.exists(row[IDX_CODE_POINT])) {
                Lib.println('${funcName} : already existing mapping for ${row[IDX_CODE_POINT]}');
                continue;
            }

            existing.set(row[IDX_CODE_POINT], true);

            sb.add('\t\tmap[0x${row[IDX_CODE_POINT]}] = 0x${row[mappingIdx]}; // ');

            var r = new Utf8();
            r.addChar(Std.parseInt('0x${row[IDX_CODE_POINT]}'));
            sb.add(r.toString());

            sb.add(" --> ");

            var r = new Utf8();
            r.addChar(Std.parseInt('0x${row[mappingIdx]}'));
            sb.add(r.toString());

            sb.add(' (${row[IDX_CHARACTER_NAME]})\n');
        }

        sb.add("\t}\n");
        fi.close();
    }

    public static function main() : Void {
        Lib.println("Starting...");

        var sb = new StringBuf();

        sb.add("package org.zamedev.lib.internal;\n");
        sb.add("\n");
        sb.add("// Use org.zamedev.lib.tools.CaseMapsGenerator to generate this file\n");
        sb.add("\n");
        sb.add("class Utf8ExtInternal {\n");
        appendMapperFunc(sb, "fillUpperToLowerMap", "Lu", IDX_LOWERCASE_MAPPING);
        sb.add("\n");
        appendMapperFunc(sb, "fillLowerToUpperMap", "Ll", IDX_UPPERCASE_MAPPING);
        sb.add("}\n");

        Lib.println("Writing result file...");
        File.saveContent(resolveInternalDir() + "/Utf8ExtInternal.hx" , sb.toString());

        Lib.println("Done");
    }
}
