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
    private static var firstChar = -1;
    private static var firstIdx = -1;
    private static var prevChar = -1;
    private static var prevIdx = -1;
    private static var curChar = -1;
    private static var curIdx = -1;
    private static var stepChar = 0;
    private static var numChar = 0;
    private static var numLines = 0;

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

    private static function appendMapperFunc(sb : StringBuf, funcName : String, generalCategory : String, mappingIdx : Int) : Void {
        Lib.println('Generating ${funcName}...');
        sb.add('\tpublic static function ${funcName}(map : Map<Int, Int>) : Void {\n');
        sb.add("\t\tvar i = 0;\n"); //to while cycles

        for (codePoint in unicodeMap.keys()) {
            var row : Array<String> = unicodeMap[codePoint];

            if (row[IDX_GENERAL_CATEGORY] != generalCategory) {
                continue;
            }

            var characterName : String = row[IDX_CHARACTER_NAME];

            while (row != null && row[mappingIdx] == "" && row[IDX_CHARACTER_DECOMPOSITION_MAPPING] != "") {
                row = unicodeMap[row[IDX_CHARACTER_DECOMPOSITION_MAPPING].split(" ")[0]];
            }

            if (row == null || row[mappingIdx] == "") {
                continue;
            }

            curChar = Std.parseInt('0x' + codePoint);
            curIdx = Std.parseInt('0x' + row[mappingIdx]);

            if (firstChar == -1) { //only first line
                newChars();
                continue;
            }

            var s = '';
            if (stepChar == 1) s = checkChars(true, false); //1,2,3
            else if (stepChar == 2) s = checkChars(false, true); //1,3,5
            else s = checkChars(true, true); //find relation
            if (s != null) sb.add(s);

            //sb.add('\t\tmap[0x${codePoint}] = 0x${row[mappingIdx]}; // ');

            //var r = new Utf8();
            //r.addChar(Std.parseInt('0x${codePoint}'));
            //sb.add(r.toString());

            //sb.add(" --> ");

            //var r = new Utf8();
            //r.addChar(Std.parseInt('0x${row[mappingIdx]}'));
            //sb.add(r.toString());

            //sb.add(' (${characterName})\n');
        }

        sb.add(addChars()); //latest line
        firstChar = -1; //reset

        sb.add("\t}\n");
        trace("Lines: " + numLines);
        numLines = 0;
    }

    public static function newChars() : Void {
        firstChar = curChar;
        firstIdx = curIdx;
        prevChar = firstChar;
        prevIdx = firstIdx;
        stepChar = 0;
        numChar = 1;
    }

    public static function checkChars(one:Bool, two:Bool) : String {
        var s = '';
        if (one && curChar == prevChar+1 && curIdx == prevIdx+1) {
            prevChar = curChar;
            prevIdx = curIdx;
            stepChar = 1;
            numChar++;
        } else if (two && curChar == prevChar+2 && curIdx == prevIdx+2) {
            prevChar = curChar;
            prevIdx = curIdx;
            stepChar = 2;
            numChar++;
        } else {
            s += addChars();
            newChars();
        }
        return s;
    }

    public static function addChars(info:Bool=true) : String {
        var s = '\t\t';
        var char = StringTools.hex(firstChar, 4);
        var idx = StringTools.hex(firstIdx, 4);
        if (numChar > 1) {
            if (stepChar == 1) s += 'for (i in 0...${numChar}) map[0x${char}+i] = 0x${idx}+i;';

            else s += 'while (i < ${numChar*2}) { map[0x${char}+i] = 0x${idx}+i; i += 2; } i = 0;';

        } else s += 'map[0x${char}] = 0x${idx};';

        if (info) { //A-Z => a-z
            s += ' //';
            var r = new Utf8();
            r.addChar(Std.parseInt('0x${char}'));
            s += r.toString();
            
            if (numChar > 1) {
                s += '-';
                var r = new Utf8();
                r.addChar(Std.parseInt('0x${char}')+numChar-1);
                s += r.toString();
            }
            s += ' => ';
            var r = new Utf8();
            r.addChar(Std.parseInt('0x${idx}'));
            s += r.toString();
            
            if (numChar > 1) {
                s += '-';
                var r = new Utf8();
                r.addChar(Std.parseInt('0x${idx}')+numChar-1);
                s += r.toString();
            }
        }

        s += '\n';
        numLines++;
        return s;
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
