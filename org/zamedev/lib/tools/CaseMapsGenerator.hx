package org.zamedev.lib.tools;

import haxe.Utf8;
import haxe.io.Eof;
import haxe.io.Path;
import neko.Lib;
import sys.io.File;
import org.zamedev.lib.ds.LinkedMap;

using StringTools;

/**
 * Map generator for Utf8ExtInternal
 * Can generate from ftp://ftp.unicode.org/Public/UNIDATA/UnicodeData.txt
 *
 * Reference - ftp://ftp.unicode.org/Public/3.2-Update/UnicodeData-3.2.0.html
 *
 * Thanks to https://github.com/RblSb for code generator optimizing ideas
 */
class CaseMapsGenerator {
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
    private static var seqFirstCodePoint : Int = -1;
    private static var seqFirstMappedCodePoint : Int = -1;
    private static var seqFirstCharacterName : String = null;
    private static var seqLastCodePoint : Int = -1;
    private static var seqLastMappedCodePoint : Int = -1;
    private static var seqLastCharacterName : String = null;
    private static var seqStep : Int = 0;
    private static var seqLength : Int = 0;
    private static var linesGenerated : Int = 0;

    macro private static function resolveThisPath() {
        return macro $v{ haxe.macro.Context.resolvePath("org/zamedev/lib/tools/CaseMapsGenerator.hx") };
    }

    private static function resolveInternalDir() : String {
        return Path.directory(resolveThisPath()) + "/../internal";
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

    private static function initSequence(codePoint : Int, mappedCodePoint : Int, characterName : String) : Void {
        seqFirstCodePoint = codePoint;
        seqFirstMappedCodePoint = mappedCodePoint;
        seqFirstCharacterName = characterName;

        seqLastCodePoint = codePoint;
        seqLastMappedCodePoint = mappedCodePoint;
        seqLastCharacterName = characterName;

        seqStep = 0;
        seqLength = 1;
    }

    private static function appendCodePoint(sb : StringBuf, codePoint : Int) : Void {
        var r = new Utf8();
        r.addChar(codePoint);
        sb.add(r.toString());
    }

    private static function appendSequence(sb : StringBuf) : Void {
        if (seqLength <= 0) {
            return;
        }

        var codePointStr = "0x" + StringTools.hex(seqFirstCodePoint);
        var mappedCodePointStr = "0x" + StringTools.hex(seqFirstMappedCodePoint);

        sb.add("\t\t");

        if (seqLength == 1) {
            sb.add('map[${codePointStr}] = ${mappedCodePointStr};');
        } else if (seqStep == 1) {
            sb.add('for (i in 0 ... ${seqLength}) { map[${codePointStr} + i] = ${mappedCodePointStr} + i; }');
        } else { // seqStep = 2
            sb.add('for (i in 0 ... ${seqLength}) { map[${codePointStr} + i + i] = ${mappedCodePointStr} + i + i; }');
        }

        sb.add(" // ");
        appendCodePoint(sb, seqFirstCodePoint);

        if (seqLength > 1) {
            sb.add(" - ");
            appendCodePoint(sb, seqLastCodePoint);
        }

        sb.add(" => ");
        appendCodePoint(sb, seqFirstMappedCodePoint);

        if (seqLength > 1) {
            sb.add(" - ");
            appendCodePoint(sb, seqLastMappedCodePoint);
        }

        sb.add(' (${seqFirstCharacterName}');

        if (seqLength > 1) {
            sb.add(' - ${seqLastCharacterName}');
        }

        sb.add(")\n");
        linesGenerated++;
    }

    private static function appendMapperFunc(sb : StringBuf, funcName : String, generalCategory : String, mappingIdx : Int) : Void {
        Lib.println('Generating ${funcName}...');
        sb.add('\tpublic static function ${funcName}(map : Map<Int, Int>) : Void {\n');

        seqFirstCodePoint = -1;
        linesGenerated = 0;

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

            var codePoint : Int = Std.parseInt('0x' + codePoint);
            var mappedCodePoint : Int = Std.parseInt('0x' + row[mappingIdx]);
            var characterName : String = row[IDX_CHARACTER_NAME];

            if (seqFirstCodePoint == -1) {
                initSequence(codePoint, mappedCodePoint, characterName);
                continue;
            }

            var step = codePoint - seqLastCodePoint;

            if ((step != 1 && step != 2)
                || (mappedCodePoint - seqLastMappedCodePoint != step)
                || (seqStep != 0 && seqStep != step)
            ) {
                appendSequence(sb);
                initSequence(codePoint, mappedCodePoint, characterName);
                continue;
            }

            seqStep = step;
            seqLastCodePoint = codePoint;
            seqLastMappedCodePoint = mappedCodePoint;
            seqLastCharacterName = characterName;
            seqLength++;
        }

        appendSequence(sb);
        sb.add("\t}\n");

        trace("Lines: " + linesGenerated);
    }

    public static function main() : Void {
        Lib.println("Preparing...");

        readUnicodeData();

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
