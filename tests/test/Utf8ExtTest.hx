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

        Assert.areEqual(Utf8Ext.toLowerCase("Α"), "α");
        Assert.areEqual(Utf8Ext.toLowerCase("Β"), "β");
        Assert.areEqual(Utf8Ext.toLowerCase("Γ"), "γ");
        Assert.areEqual(Utf8Ext.toLowerCase("Δ"), "δ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ε"), "ε");
        Assert.areEqual(Utf8Ext.toLowerCase("Ζ"), "ζ");
        Assert.areEqual(Utf8Ext.toLowerCase("Η"), "η");
        Assert.areEqual(Utf8Ext.toLowerCase("Θ"), "θ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ι"), "ι");
        Assert.areEqual(Utf8Ext.toLowerCase("Κ"), "κ");
        Assert.areEqual(Utf8Ext.toLowerCase("Λ"), "λ");
        Assert.areEqual(Utf8Ext.toLowerCase("Μ"), "μ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ν"), "ν");
        Assert.areEqual(Utf8Ext.toLowerCase("Ξ"), "ξ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ο"), "ο");
        Assert.areEqual(Utf8Ext.toLowerCase("Π"), "π");
        Assert.areEqual(Utf8Ext.toLowerCase("Ρ"), "ρ");
        #if !js Assert.areEqual(Utf8Ext.toLowerCase("Σ"), "σ"); #end // Chrome = "ς", Firefox = "σ", Safari = "σ"
        Assert.areEqual(Utf8Ext.toLowerCase("Τ"), "τ");
        Assert.areEqual(Utf8Ext.toLowerCase("Υ"), "υ");
        Assert.areEqual(Utf8Ext.toLowerCase("Φ"), "φ");
        Assert.areEqual(Utf8Ext.toLowerCase("Χ"), "χ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ψ"), "ψ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ω"), "ω");
        Assert.areEqual(Utf8Ext.toLowerCase("ς"), "ς");
        Assert.areEqual(Utf8Ext.toLowerCase("Ά"), "ά");
        Assert.areEqual(Utf8Ext.toLowerCase("Έ"), "έ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ή"), "ή");
        Assert.areEqual(Utf8Ext.toLowerCase("Ί"), "ί");
        Assert.areEqual(Utf8Ext.toLowerCase("Ό"), "ό");
        Assert.areEqual(Utf8Ext.toLowerCase("Ύ"), "ύ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ϋ́"), "ΰ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ώ"), "ώ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ϊ"), "ϊ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ϊ́"), "ΐ");
        Assert.areEqual(Utf8Ext.toLowerCase("Ϋ"), "ϋ");
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

        Assert.areEqual(Utf8Ext.toUpperCase("α"), "Α");
        Assert.areEqual(Utf8Ext.toUpperCase("β"), "Β");
        Assert.areEqual(Utf8Ext.toUpperCase("γ"), "Γ");
        Assert.areEqual(Utf8Ext.toUpperCase("δ"), "Δ");
        Assert.areEqual(Utf8Ext.toUpperCase("ε"), "Ε");
        Assert.areEqual(Utf8Ext.toUpperCase("ζ"), "Ζ");
        Assert.areEqual(Utf8Ext.toUpperCase("η"), "Η");
        Assert.areEqual(Utf8Ext.toUpperCase("θ"), "Θ");
        Assert.areEqual(Utf8Ext.toUpperCase("ι"), "Ι");
        Assert.areEqual(Utf8Ext.toUpperCase("κ"), "Κ");
        Assert.areEqual(Utf8Ext.toUpperCase("λ"), "Λ");
        Assert.areEqual(Utf8Ext.toUpperCase("μ"), "Μ");
        Assert.areEqual(Utf8Ext.toUpperCase("ν"), "Ν");
        Assert.areEqual(Utf8Ext.toUpperCase("ξ"), "Ξ");
        Assert.areEqual(Utf8Ext.toUpperCase("ο"), "Ο");
        Assert.areEqual(Utf8Ext.toUpperCase("π"), "Π");
        Assert.areEqual(Utf8Ext.toUpperCase("ρ"), "Ρ");
        Assert.areEqual(Utf8Ext.toUpperCase("σ"), "Σ");
        Assert.areEqual(Utf8Ext.toUpperCase("τ"), "Τ");
        Assert.areEqual(Utf8Ext.toUpperCase("υ"), "Υ");
        Assert.areEqual(Utf8Ext.toUpperCase("φ"), "Φ");
        Assert.areEqual(Utf8Ext.toUpperCase("χ"), "Χ");
        Assert.areEqual(Utf8Ext.toUpperCase("ψ"), "Ψ");
        Assert.areEqual(Utf8Ext.toUpperCase("ω"), "Ω");
        #if !flash Assert.areEqual(Utf8Ext.toUpperCase("ς"), "Σ"); #end // Flash = "΢"
        Assert.areEqual(Utf8Ext.toUpperCase("ά"), "Ά");
        Assert.areEqual(Utf8Ext.toUpperCase("έ"), "Έ");
        Assert.areEqual(Utf8Ext.toUpperCase("ή"), "Ή");
        Assert.areEqual(Utf8Ext.toUpperCase("ί"), "Ί");
        Assert.areEqual(Utf8Ext.toUpperCase("ό"), "Ό");
        Assert.areEqual(Utf8Ext.toUpperCase("ύ"), "Ύ");
        #if (!js && !flash) Assert.areEqual(Utf8Ext.toUpperCase("ΰ"), "Ϋ"); #end // Chrome = "Ϋ́", Firefox = "ΰ", Safari = "Ϋ́", Flash = "ΰ"
        Assert.areEqual(Utf8Ext.toUpperCase("ΰ"), "Ϋ́");
        Assert.areEqual(Utf8Ext.toUpperCase("ώ"), "Ώ");
        Assert.areEqual(Utf8Ext.toUpperCase("ϊ"), "Ϊ");
        Assert.areEqual(Utf8Ext.toUpperCase("ΐ"), "Ϊ́");
        #if (!js && !flash) Assert.areEqual(Utf8Ext.toUpperCase("ΐ"), "Ϊ"); #end // Chrome = "Ϊ́", Firefox = "ΐ", Safari = "Ϊ́", Flash = "ΐ"
        Assert.areEqual(Utf8Ext.toUpperCase("ϋ"), "Ϋ");
    }
}
