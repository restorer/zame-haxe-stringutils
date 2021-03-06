package internal;

import haxe.io.Eof;
import haxe.io.Path;
import sys.io.File;
import org.zamedev.lib.ds.LinkedMap;

#if neko
    import neko.Utf8;
#end

/**
 * Map generator for Utf8ExtInternal
 * Can generate from ftp://ftp.unicode.org/Public/UNIDATA/UnicodeData.txt
 *
 * Reference - ftp://ftp.unicode.org/Public/3.2-Update/UnicodeData-3.2.0.html
 */
class EthalonCaseMapsGenerator {
    private static inline var IDX_CODE_POINT : Int = 0;
    private static inline var IDX_CHARACTER_NAME : Int = 1;
    private static inline var IDX_GENERAL_CATEGORY : Int = 2;
    // Canonical Combining Classes = 3
    // Bidirectional Category = 4
    private static inline var IDX_CHARACTER_DECOMPOSITION_MAPPING : Int = 5;
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

    private static var unicodeMap : LinkedMap<String, Array<String>>;

    macro private static function resolveThisPath() {
        return macro $v{ haxe.macro.Context.resolvePath("test/internal/EthalonCaseMapsGenerator.hx") };
    }

    private static function resolveThisDir() : String {
        return Path.directory(resolveThisPath());
    }

    private static function readUnicodeData() : Void {
        var fi = File.read("additional/UnicodeData.txt", true);
        unicodeMap = new LinkedMap<String, Array<String>>();

        while (true) {
            var row : Array<String>;

            try {
                row = fi.readLine().split(";");
            } catch (ex : Eof) {
                break;
            }

            if (row.length < IDX_LAST || (row[IDX_GENERAL_CATEGORY] != "Lu" && row[IDX_GENERAL_CATEGORY] != "Ll")) {
                continue;
            }

            unicodeMap[row[IDX_CODE_POINT]] = row;
        }

        fi.close();
    }

    private static function appendMapperFunc(sb : StringBuf, funcName : String, generalCategory : String, mappingIdx : Int) : Void {
        println('Generating ${funcName}...');
        sb.add('\tpublic static function ${funcName}(map : Map<Int, Int>) : Void {\n');

        for (codePoint in unicodeMap.keys()) {
            var row : Array<String> = unicodeMap[codePoint];

            if (row[IDX_GENERAL_CATEGORY] != generalCategory) {
                continue;
            }

            while (row != null && row[mappingIdx] == "" && row[IDX_CHARACTER_DECOMPOSITION_MAPPING] != "") {
                row = unicodeMap[row[IDX_CHARACTER_DECOMPOSITION_MAPPING].split(" ")[0]];
            }

            if (row == null || row[mappingIdx] == "") {
                continue;
            }

            sb.add('\t\tmap[0x${codePoint}] = 0x${row[mappingIdx]}; // ');

            #if neko
                var r = new Utf8();
                r.addChar(Std.parseInt('0x${codePoint}'));
                sb.add(r.toString());
            #else
                sb.add(String.fromCharCode(Std.parseInt('0x${codePoint}')));
            #end

            sb.add(" --> ");

            #if neko
                var r = new Utf8();
                r.addChar(Std.parseInt('0x${row[mappingIdx]}'));
                sb.add(r.toString());
            #else
                sb.add(String.fromCharCode(Std.parseInt('0x${row[mappingIdx]}')));
            #end

            sb.add(' (${row[IDX_CHARACTER_NAME]})\n');
        }

        sb.add("\t}\n");
    }

    public static function main() : Void {
        println("Preparing...");

        readUnicodeData();

        var sb = new StringBuf();

        sb.add("package internal;\n");
        sb.add("\n");
        sb.add("// Use internal.EthalonCaseMapsGenerator to generate this file.\n");
        sb.add("\n");
        sb.add("class Utf8ExtInternalEthalon {\n");
        appendMapperFunc(sb, "fillUpperToLowerMap", "Lu", IDX_LOWERCASE_MAPPING);
        sb.add("\n");
        appendMapperFunc(sb, "fillLowerToUpperMap", "Ll", IDX_UPPERCASE_MAPPING);
        sb.add("}\n");

        println("Writing result file...");
        File.saveContent(resolveThisDir() + "/Utf8ExtInternalEthalon.hx" , sb.toString());

        println("Done");
    }

    private static function println(message : String) : Void {
        #if sys
            Sys.print(message + "\n");
        #elseif neko
            neko.Lib.println(message);
        #else
            trace(message);
        #end
    }
}
