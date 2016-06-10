/*
 *  Original java implementation:
 *  Copyright (c) 2014, Facebook, Inc.
 *  All rights reserved.
 *
 *  Haxe version:
 *  Copyright (c) 2015, Viachaslau Tratsiak.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the original project repo:
 *  https://github.com/BoltsFramework/Bolts-Android/
 *
 */
package ;

import massive.munit.Assert;
import org.zamedev.lib.Utf8Ext;

class Utf8ExtTest {
    public function new() : Void {
    }

    @Test
    public function testUpperToLowerMapping() : Void {
        Assert.areEqual(Utf8Ext.toLowerCase(" "), " ");
        Assert.areEqual(Utf8Ext.toLowerCase("."), ".");
        Assert.areEqual(Utf8Ext.toLowerCase(","), ",");
        Assert.areEqual(Utf8Ext.toLowerCase("!"), "!");
        Assert.areEqual(Utf8Ext.toLowerCase("0"), "0");
        Assert.areEqual(Utf8Ext.toLowerCase("1"), "1");
        Assert.areEqual(Utf8Ext.toLowerCase("2"), "2");
        Assert.areEqual(Utf8Ext.toLowerCase("3"), "3");
        Assert.areEqual(Utf8Ext.toLowerCase("4"), "4");
        Assert.areEqual(Utf8Ext.toLowerCase("5"), "5");
        Assert.areEqual(Utf8Ext.toLowerCase("6"), "6");
        Assert.areEqual(Utf8Ext.toLowerCase("7"), "7");
        Assert.areEqual(Utf8Ext.toLowerCase("8"), "8");
        Assert.areEqual(Utf8Ext.toLowerCase("9"), "9");
        Assert.areEqual(Utf8Ext.toLowerCase("A"), "a");
        Assert.areEqual(Utf8Ext.toLowerCase("B"), "b");
        Assert.areEqual(Utf8Ext.toLowerCase("C"), "c");
        Assert.areEqual(Utf8Ext.toLowerCase("D"), "d");
        Assert.areEqual(Utf8Ext.toLowerCase("E"), "e");
        Assert.areEqual(Utf8Ext.toLowerCase("F"), "f");
        Assert.areEqual(Utf8Ext.toLowerCase("G"), "g");
        Assert.areEqual(Utf8Ext.toLowerCase("H"), "h");
        Assert.areEqual(Utf8Ext.toLowerCase("I"), "i");
        Assert.areEqual(Utf8Ext.toLowerCase("J"), "j");
        Assert.areEqual(Utf8Ext.toLowerCase("K"), "k");
        Assert.areEqual(Utf8Ext.toLowerCase("L"), "l");
        Assert.areEqual(Utf8Ext.toLowerCase("M"), "m");
        Assert.areEqual(Utf8Ext.toLowerCase("N"), "n");
        Assert.areEqual(Utf8Ext.toLowerCase("O"), "o");
        Assert.areEqual(Utf8Ext.toLowerCase("P"), "p");
        Assert.areEqual(Utf8Ext.toLowerCase("Q"), "q");
        Assert.areEqual(Utf8Ext.toLowerCase("R"), "r");
        Assert.areEqual(Utf8Ext.toLowerCase("S"), "s");
        Assert.areEqual(Utf8Ext.toLowerCase("T"), "t");
        Assert.areEqual(Utf8Ext.toLowerCase("U"), "u");
        Assert.areEqual(Utf8Ext.toLowerCase("V"), "v");
        Assert.areEqual(Utf8Ext.toLowerCase("W"), "w");
        Assert.areEqual(Utf8Ext.toLowerCase("X"), "x");
        Assert.areEqual(Utf8Ext.toLowerCase("Y"), "y");
        Assert.areEqual(Utf8Ext.toLowerCase("Z"), "z");
        Assert.areEqual(Utf8Ext.toLowerCase("А"), "а");
        Assert.areEqual(Utf8Ext.toLowerCase("Б"), "б");
        Assert.areEqual(Utf8Ext.toLowerCase("В"), "в");
        Assert.areEqual(Utf8Ext.toLowerCase("Г"), "г");
        Assert.areEqual(Utf8Ext.toLowerCase("Д"), "д");
        Assert.areEqual(Utf8Ext.toLowerCase("Е"), "е");
        Assert.areEqual(Utf8Ext.toLowerCase("Ё"), "ё");
        Assert.areEqual(Utf8Ext.toLowerCase("Ж"), "ж");
        Assert.areEqual(Utf8Ext.toLowerCase("З"), "з");
        Assert.areEqual(Utf8Ext.toLowerCase("И"), "и");
        Assert.areEqual(Utf8Ext.toLowerCase("Й"), "й");
        Assert.areEqual(Utf8Ext.toLowerCase("К"), "к");
        Assert.areEqual(Utf8Ext.toLowerCase("Л"), "л");
        Assert.areEqual(Utf8Ext.toLowerCase("М"), "м");
        Assert.areEqual(Utf8Ext.toLowerCase("Н"), "н");
        Assert.areEqual(Utf8Ext.toLowerCase("О"), "о");
        Assert.areEqual(Utf8Ext.toLowerCase("П"), "п");
        Assert.areEqual(Utf8Ext.toLowerCase("Р"), "р");
        Assert.areEqual(Utf8Ext.toLowerCase("С"), "с");
        Assert.areEqual(Utf8Ext.toLowerCase("Т"), "т");
        Assert.areEqual(Utf8Ext.toLowerCase("У"), "у");
        Assert.areEqual(Utf8Ext.toLowerCase("Ф"), "ф");
        Assert.areEqual(Utf8Ext.toLowerCase("Х"), "х");
        Assert.areEqual(Utf8Ext.toLowerCase("Ц"), "ц");
        Assert.areEqual(Utf8Ext.toLowerCase("Ч"), "ч");
        Assert.areEqual(Utf8Ext.toLowerCase("Ш"), "ш");
        Assert.areEqual(Utf8Ext.toLowerCase("Щ"), "щ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ъ"), "ъ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ы"), "ы");
        Assert.areEqual(Utf8Ext.toLowerCase("Ь"), "ь");
        Assert.areEqual(Utf8Ext.toLowerCase("Э"), "э");
        Assert.areEqual(Utf8Ext.toLowerCase("Ю"), "ю");
        Assert.areEqual(Utf8Ext.toLowerCase("Я"), "я");
        Assert.areEqual(Utf8Ext.toLowerCase("Ä"), "ä");
    }

    @Test
    public function testLowerToUpperMapping() : Void {
        Assert.areEqual(Utf8Ext.toUpperCase(" "), " ");
        Assert.areEqual(Utf8Ext.toUpperCase("."), ".");
        Assert.areEqual(Utf8Ext.toUpperCase(","), ",");
        Assert.areEqual(Utf8Ext.toUpperCase("!"), "!");
        Assert.areEqual(Utf8Ext.toUpperCase("0"), "0");
        Assert.areEqual(Utf8Ext.toUpperCase("1"), "1");
        Assert.areEqual(Utf8Ext.toUpperCase("2"), "2");
        Assert.areEqual(Utf8Ext.toUpperCase("3"), "3");
        Assert.areEqual(Utf8Ext.toUpperCase("4"), "4");
        Assert.areEqual(Utf8Ext.toUpperCase("5"), "5");
        Assert.areEqual(Utf8Ext.toUpperCase("6"), "6");
        Assert.areEqual(Utf8Ext.toUpperCase("7"), "7");
        Assert.areEqual(Utf8Ext.toUpperCase("8"), "8");
        Assert.areEqual(Utf8Ext.toUpperCase("9"), "9");
        Assert.areEqual(Utf8Ext.toUpperCase("a"), "A");
        Assert.areEqual(Utf8Ext.toUpperCase("b"), "B");
        Assert.areEqual(Utf8Ext.toUpperCase("c"), "C");
        Assert.areEqual(Utf8Ext.toUpperCase("d"), "D");
        Assert.areEqual(Utf8Ext.toUpperCase("e"), "E");
        Assert.areEqual(Utf8Ext.toUpperCase("f"), "F");
        Assert.areEqual(Utf8Ext.toUpperCase("g"), "G");
        Assert.areEqual(Utf8Ext.toUpperCase("h"), "H");
        Assert.areEqual(Utf8Ext.toUpperCase("i"), "I");
        Assert.areEqual(Utf8Ext.toUpperCase("j"), "J");
        Assert.areEqual(Utf8Ext.toUpperCase("k"), "K");
        Assert.areEqual(Utf8Ext.toUpperCase("l"), "L");
        Assert.areEqual(Utf8Ext.toUpperCase("m"), "M");
        Assert.areEqual(Utf8Ext.toUpperCase("n"), "N");
        Assert.areEqual(Utf8Ext.toUpperCase("o"), "O");
        Assert.areEqual(Utf8Ext.toUpperCase("p"), "P");
        Assert.areEqual(Utf8Ext.toUpperCase("q"), "Q");
        Assert.areEqual(Utf8Ext.toUpperCase("r"), "R");
        Assert.areEqual(Utf8Ext.toUpperCase("s"), "S");
        Assert.areEqual(Utf8Ext.toUpperCase("t"), "T");
        Assert.areEqual(Utf8Ext.toUpperCase("u"), "U");
        Assert.areEqual(Utf8Ext.toUpperCase("v"), "V");
        Assert.areEqual(Utf8Ext.toUpperCase("w"), "W");
        Assert.areEqual(Utf8Ext.toUpperCase("x"), "X");
        Assert.areEqual(Utf8Ext.toUpperCase("y"), "Y");
        Assert.areEqual(Utf8Ext.toUpperCase("z"), "Z");
        Assert.areEqual(Utf8Ext.toUpperCase("а"), "А");
        Assert.areEqual(Utf8Ext.toUpperCase("б"), "Б");
        Assert.areEqual(Utf8Ext.toUpperCase("в"), "В");
        Assert.areEqual(Utf8Ext.toUpperCase("г"), "Г");
        Assert.areEqual(Utf8Ext.toUpperCase("д"), "Д");
        Assert.areEqual(Utf8Ext.toUpperCase("е"), "Е");
        Assert.areEqual(Utf8Ext.toUpperCase("ё"), "Ё");
        Assert.areEqual(Utf8Ext.toUpperCase("ж"), "Ж");
        Assert.areEqual(Utf8Ext.toUpperCase("з"), "З");
        Assert.areEqual(Utf8Ext.toUpperCase("и"), "И");
        Assert.areEqual(Utf8Ext.toUpperCase("й"), "Й");
        Assert.areEqual(Utf8Ext.toUpperCase("к"), "К");
        Assert.areEqual(Utf8Ext.toUpperCase("л"), "Л");
        Assert.areEqual(Utf8Ext.toUpperCase("м"), "М");
        Assert.areEqual(Utf8Ext.toUpperCase("н"), "Н");
        Assert.areEqual(Utf8Ext.toUpperCase("о"), "О");
        Assert.areEqual(Utf8Ext.toUpperCase("п"), "П");
        Assert.areEqual(Utf8Ext.toUpperCase("р"), "Р");
        Assert.areEqual(Utf8Ext.toUpperCase("с"), "С");
        Assert.areEqual(Utf8Ext.toUpperCase("т"), "Т");
        Assert.areEqual(Utf8Ext.toUpperCase("у"), "У");
        Assert.areEqual(Utf8Ext.toUpperCase("ф"), "Ф");
        Assert.areEqual(Utf8Ext.toUpperCase("х"), "Х");
        Assert.areEqual(Utf8Ext.toUpperCase("ц"), "Ц");
        Assert.areEqual(Utf8Ext.toUpperCase("ч"), "Ч");
        Assert.areEqual(Utf8Ext.toUpperCase("ш"), "Ш");
        Assert.areEqual(Utf8Ext.toUpperCase("щ"), "Щ");
        Assert.areEqual(Utf8Ext.toUpperCase("ъ"), "Ъ");
        Assert.areEqual(Utf8Ext.toUpperCase("ы"), "Ы");
        Assert.areEqual(Utf8Ext.toUpperCase("ь"), "Ь");
        Assert.areEqual(Utf8Ext.toUpperCase("э"), "Э");
        Assert.areEqual(Utf8Ext.toUpperCase("ю"), "Ю");
        Assert.areEqual(Utf8Ext.toUpperCase("я"), "Я");
        Assert.areEqual(Utf8Ext.toUpperCase("ä"), "Ä");
    }
}