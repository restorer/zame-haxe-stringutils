package test;

import org.zamedev.lib.Utf8Ext;
import utest.Assert;
import utest.Test;

class Utf8ExtTest extends Test {
    public function testToLowerCase() : Void {
        var str = "This is thE test. Привет! Миру миР! αβγδεζηθικλμνξοπρστυφχψωςάέήίόύΰώϊΐϋ";
        var lcStr = "this is the test. привет! миру мир! αβγδεζηθικλμνξοπρστυφχψωςάέήίόύΰώϊΐϋ";

        Assert.equals(lcStr, Utf8Ext.toLowerCase(str));
        Assert.equals("日本語", Utf8Ext.toLowerCase("日本語"));
    }

    public function testToUpperCase() : Void {
        #if neko
            // Neko for sure use internal implementation. Other targets may use native implementation (especially on Haxe 4)
            var str = "This is thE test. Привет! Миру миР! αβγδεζηθικλμνξοπρστυφχψωςάέήίόύώϊϋ ΰΐ";
            var ucStr = "THIS IS THE TEST. ПРИВЕТ! МИРУ МИР! ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΣΆΈΉΊΌΎΏΪΫ ΫΪ";
        #else
            var str = "This is thE test. Привет! Миру миР! αβγδεζηθικλμνξοπρστυφχψωςάέήίόύώϊϋ";
            var ucStr = "THIS IS THE TEST. ПРИВЕТ! МИРУ МИР! ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΣΆΈΉΊΌΎΏΪΫ";
        #end

        Assert.equals(ucStr, Utf8Ext.toUpperCase(str));
        Assert.equals("日本語", Utf8Ext.toUpperCase("日本語"));
    }

    public function testGetUnicodeRe() : Void {
        var str = "This is thE test. Привет! Миру миР! αβγδεζηθικλμνξοπρστυφχψωςάέήίόύΰώϊΐϋ";
        var replA = "---- -- --- ----. ------! ---- ---! ------------------------------------";
        var replB = "This-is-thE-test--Привет--Миру-миР--αβγδεζηθικλμνξοπρστυφχψωςάέήίόύΰώϊΐϋ";

        Assert.equals(replA, Utf8Ext.getUnicodeRe().replace(str, "-"));
        Assert.equals(replB, Utf8Ext.getUnicodeRe("^").replace(str, "-"));
    }

    public function testUpperToLowerMapping() : Void {
        Assert.equals(" ", Utf8Ext.toLowerCase(" "));
        Assert.equals(".", Utf8Ext.toLowerCase("."));
        Assert.equals(",", Utf8Ext.toLowerCase(","));
        Assert.equals("!", Utf8Ext.toLowerCase("!"));
        Assert.equals("0", Utf8Ext.toLowerCase("0"));
        Assert.equals("1", Utf8Ext.toLowerCase("1"));
        Assert.equals("2", Utf8Ext.toLowerCase("2"));
        Assert.equals("3", Utf8Ext.toLowerCase("3"));
        Assert.equals("4", Utf8Ext.toLowerCase("4"));
        Assert.equals("5", Utf8Ext.toLowerCase("5"));
        Assert.equals("6", Utf8Ext.toLowerCase("6"));
        Assert.equals("7", Utf8Ext.toLowerCase("7"));
        Assert.equals("8", Utf8Ext.toLowerCase("8"));
        Assert.equals("9", Utf8Ext.toLowerCase("9"));

        Assert.equals("a", Utf8Ext.toLowerCase("A"));
        Assert.equals("b", Utf8Ext.toLowerCase("B"));
        Assert.equals("c", Utf8Ext.toLowerCase("C"));
        Assert.equals("d", Utf8Ext.toLowerCase("D"));
        Assert.equals("e", Utf8Ext.toLowerCase("E"));
        Assert.equals("f", Utf8Ext.toLowerCase("F"));
        Assert.equals("g", Utf8Ext.toLowerCase("G"));
        Assert.equals("h", Utf8Ext.toLowerCase("H"));
        Assert.equals("i", Utf8Ext.toLowerCase("I"));
        Assert.equals("j", Utf8Ext.toLowerCase("J"));
        Assert.equals("k", Utf8Ext.toLowerCase("K"));
        Assert.equals("l", Utf8Ext.toLowerCase("L"));
        Assert.equals("m", Utf8Ext.toLowerCase("M"));
        Assert.equals("n", Utf8Ext.toLowerCase("N"));
        Assert.equals("o", Utf8Ext.toLowerCase("O"));
        Assert.equals("p", Utf8Ext.toLowerCase("P"));
        Assert.equals("q", Utf8Ext.toLowerCase("Q"));
        Assert.equals("r", Utf8Ext.toLowerCase("R"));
        Assert.equals("s", Utf8Ext.toLowerCase("S"));
        Assert.equals("t", Utf8Ext.toLowerCase("T"));
        Assert.equals("u", Utf8Ext.toLowerCase("U"));
        Assert.equals("v", Utf8Ext.toLowerCase("V"));
        Assert.equals("w", Utf8Ext.toLowerCase("W"));
        Assert.equals("x", Utf8Ext.toLowerCase("X"));
        Assert.equals("y", Utf8Ext.toLowerCase("Y"));
        Assert.equals("z", Utf8Ext.toLowerCase("Z"));

        Assert.equals("а", Utf8Ext.toLowerCase("А"));
        Assert.equals("б", Utf8Ext.toLowerCase("Б"));
        Assert.equals("в", Utf8Ext.toLowerCase("В"));
        Assert.equals("г", Utf8Ext.toLowerCase("Г"));
        Assert.equals("д", Utf8Ext.toLowerCase("Д"));
        Assert.equals("е", Utf8Ext.toLowerCase("Е"));
        Assert.equals("ё", Utf8Ext.toLowerCase("Ё"));
        Assert.equals("ж", Utf8Ext.toLowerCase("Ж"));
        Assert.equals("з", Utf8Ext.toLowerCase("З"));
        Assert.equals("и", Utf8Ext.toLowerCase("И"));
        Assert.equals("й", Utf8Ext.toLowerCase("Й"));
        Assert.equals("к", Utf8Ext.toLowerCase("К"));
        Assert.equals("л", Utf8Ext.toLowerCase("Л"));
        Assert.equals("м", Utf8Ext.toLowerCase("М"));
        Assert.equals("н", Utf8Ext.toLowerCase("Н"));
        Assert.equals("о", Utf8Ext.toLowerCase("О"));
        Assert.equals("п", Utf8Ext.toLowerCase("П"));
        Assert.equals("р", Utf8Ext.toLowerCase("Р"));
        Assert.equals("с", Utf8Ext.toLowerCase("С"));
        Assert.equals("т", Utf8Ext.toLowerCase("Т"));
        Assert.equals("у", Utf8Ext.toLowerCase("У"));
        Assert.equals("ф", Utf8Ext.toLowerCase("Ф"));
        Assert.equals("х", Utf8Ext.toLowerCase("Х"));
        Assert.equals("ц", Utf8Ext.toLowerCase("Ц"));
        Assert.equals("ч", Utf8Ext.toLowerCase("Ч"));
        Assert.equals("ш", Utf8Ext.toLowerCase("Ш"));
        Assert.equals("щ", Utf8Ext.toLowerCase("Щ"));
        Assert.equals("ъ", Utf8Ext.toLowerCase("Ъ"));
        Assert.equals("ы", Utf8Ext.toLowerCase("Ы"));
        Assert.equals("ь", Utf8Ext.toLowerCase("Ь"));
        Assert.equals("э", Utf8Ext.toLowerCase("Э"));
        Assert.equals("ю", Utf8Ext.toLowerCase("Ю"));
        Assert.equals("я", Utf8Ext.toLowerCase("Я"));

        Assert.equals("ä", Utf8Ext.toLowerCase("Ä"));

        Assert.equals("α", Utf8Ext.toLowerCase("Α"));
        Assert.equals("β", Utf8Ext.toLowerCase("Β"));
        Assert.equals("γ", Utf8Ext.toLowerCase("Γ"));
        Assert.equals("δ", Utf8Ext.toLowerCase("Δ"));
        Assert.equals("ε", Utf8Ext.toLowerCase("Ε"));
        Assert.equals("ζ", Utf8Ext.toLowerCase("Ζ"));
        Assert.equals("η", Utf8Ext.toLowerCase("Η"));
        Assert.equals("θ", Utf8Ext.toLowerCase("Θ"));
        Assert.equals("ι", Utf8Ext.toLowerCase("Ι"));
        Assert.equals("κ", Utf8Ext.toLowerCase("Κ"));
        Assert.equals("λ", Utf8Ext.toLowerCase("Λ"));
        Assert.equals("μ", Utf8Ext.toLowerCase("Μ"));
        Assert.equals("ν", Utf8Ext.toLowerCase("Ν"));
        Assert.equals("ξ", Utf8Ext.toLowerCase("Ξ"));
        Assert.equals("ο", Utf8Ext.toLowerCase("Ο"));
        Assert.equals("π", Utf8Ext.toLowerCase("Π"));
        Assert.equals("ρ", Utf8Ext.toLowerCase("Ρ"));

        #if (!js)
            // Chrome = "ς", Firefox = "σ", Safari = "σ"
            Assert.equals("σ", Utf8Ext.toLowerCase("Σ"));
        #end

        Assert.equals("τ", Utf8Ext.toLowerCase("Τ"));
        Assert.equals("υ", Utf8Ext.toLowerCase("Υ"));
        Assert.equals("φ", Utf8Ext.toLowerCase("Φ"));
        Assert.equals("χ", Utf8Ext.toLowerCase("Χ"));
        Assert.equals("ψ", Utf8Ext.toLowerCase("Ψ"));
        Assert.equals("ω", Utf8Ext.toLowerCase("Ω"));
        Assert.equals("ς", Utf8Ext.toLowerCase("ς"));
        Assert.equals("ά", Utf8Ext.toLowerCase("Ά"));
        Assert.equals("έ", Utf8Ext.toLowerCase("Έ"));
        Assert.equals("ή", Utf8Ext.toLowerCase("Ή"));
        Assert.equals("ί", Utf8Ext.toLowerCase("Ί"));
        Assert.equals("ό", Utf8Ext.toLowerCase("Ό"));
        Assert.equals("ύ", Utf8Ext.toLowerCase("Ύ"));
        Assert.equals("ΰ", Utf8Ext.toLowerCase("Ϋ́"));
        Assert.equals("ώ", Utf8Ext.toLowerCase("Ώ"));
        Assert.equals("ϊ", Utf8Ext.toLowerCase("Ϊ"));
        Assert.equals("ΐ", Utf8Ext.toLowerCase("Ϊ́"));
        Assert.equals("ϋ", Utf8Ext.toLowerCase("Ϋ"));
    }

    @Test
    public function testLowerToUpperMapping() : Void {
        Assert.equals(" ", Utf8Ext.toUpperCase(" "));
        Assert.equals(".", Utf8Ext.toUpperCase("."));
        Assert.equals(",", Utf8Ext.toUpperCase(","));
        Assert.equals("!", Utf8Ext.toUpperCase("!"));
        Assert.equals("0", Utf8Ext.toUpperCase("0"));
        Assert.equals("1", Utf8Ext.toUpperCase("1"));
        Assert.equals("2", Utf8Ext.toUpperCase("2"));
        Assert.equals("3", Utf8Ext.toUpperCase("3"));
        Assert.equals("4", Utf8Ext.toUpperCase("4"));
        Assert.equals("5", Utf8Ext.toUpperCase("5"));
        Assert.equals("6", Utf8Ext.toUpperCase("6"));
        Assert.equals("7", Utf8Ext.toUpperCase("7"));
        Assert.equals("8", Utf8Ext.toUpperCase("8"));
        Assert.equals("9", Utf8Ext.toUpperCase("9"));

        Assert.equals("A", Utf8Ext.toUpperCase("a"));
        Assert.equals("B", Utf8Ext.toUpperCase("b"));
        Assert.equals("C", Utf8Ext.toUpperCase("c"));
        Assert.equals("D", Utf8Ext.toUpperCase("d"));
        Assert.equals("E", Utf8Ext.toUpperCase("e"));
        Assert.equals("F", Utf8Ext.toUpperCase("f"));
        Assert.equals("G", Utf8Ext.toUpperCase("g"));
        Assert.equals("H", Utf8Ext.toUpperCase("h"));
        Assert.equals("I", Utf8Ext.toUpperCase("i"));
        Assert.equals("J", Utf8Ext.toUpperCase("j"));
        Assert.equals("K", Utf8Ext.toUpperCase("k"));
        Assert.equals("L", Utf8Ext.toUpperCase("l"));
        Assert.equals("M", Utf8Ext.toUpperCase("m"));
        Assert.equals("N", Utf8Ext.toUpperCase("n"));
        Assert.equals("O", Utf8Ext.toUpperCase("o"));
        Assert.equals("P", Utf8Ext.toUpperCase("p"));
        Assert.equals("Q", Utf8Ext.toUpperCase("q"));
        Assert.equals("R", Utf8Ext.toUpperCase("r"));
        Assert.equals("S", Utf8Ext.toUpperCase("s"));
        Assert.equals("T", Utf8Ext.toUpperCase("t"));
        Assert.equals("U", Utf8Ext.toUpperCase("u"));
        Assert.equals("V", Utf8Ext.toUpperCase("v"));
        Assert.equals("W", Utf8Ext.toUpperCase("w"));
        Assert.equals("X", Utf8Ext.toUpperCase("x"));
        Assert.equals("Y", Utf8Ext.toUpperCase("y"));
        Assert.equals("Z", Utf8Ext.toUpperCase("z"));

        Assert.equals("А", Utf8Ext.toUpperCase("а"));
        Assert.equals("Б", Utf8Ext.toUpperCase("б"));
        Assert.equals("В", Utf8Ext.toUpperCase("в"));
        Assert.equals("Г", Utf8Ext.toUpperCase("г"));
        Assert.equals("Д", Utf8Ext.toUpperCase("д"));
        Assert.equals("Е", Utf8Ext.toUpperCase("е"));
        Assert.equals("Ё", Utf8Ext.toUpperCase("ё"));
        Assert.equals("Ж", Utf8Ext.toUpperCase("ж"));
        Assert.equals("З", Utf8Ext.toUpperCase("з"));
        Assert.equals("И", Utf8Ext.toUpperCase("и"));
        Assert.equals("Й", Utf8Ext.toUpperCase("й"));
        Assert.equals("К", Utf8Ext.toUpperCase("к"));
        Assert.equals("Л", Utf8Ext.toUpperCase("л"));
        Assert.equals("М", Utf8Ext.toUpperCase("м"));
        Assert.equals("Н", Utf8Ext.toUpperCase("н"));
        Assert.equals("О", Utf8Ext.toUpperCase("о"));
        Assert.equals("П", Utf8Ext.toUpperCase("п"));
        Assert.equals("Р", Utf8Ext.toUpperCase("р"));
        Assert.equals("С", Utf8Ext.toUpperCase("с"));
        Assert.equals("Т", Utf8Ext.toUpperCase("т"));
        Assert.equals("У", Utf8Ext.toUpperCase("у"));
        Assert.equals("Ф", Utf8Ext.toUpperCase("ф"));
        Assert.equals("Х", Utf8Ext.toUpperCase("х"));
        Assert.equals("Ц", Utf8Ext.toUpperCase("ц"));
        Assert.equals("Ч", Utf8Ext.toUpperCase("ч"));
        Assert.equals("Ш", Utf8Ext.toUpperCase("ш"));
        Assert.equals("Щ", Utf8Ext.toUpperCase("щ"));
        Assert.equals("Ъ", Utf8Ext.toUpperCase("ъ"));
        Assert.equals("Ы", Utf8Ext.toUpperCase("ы"));
        Assert.equals("Ь", Utf8Ext.toUpperCase("ь"));
        Assert.equals("Э", Utf8Ext.toUpperCase("э"));
        Assert.equals("Ю", Utf8Ext.toUpperCase("ю"));
        Assert.equals("Я", Utf8Ext.toUpperCase("я"));

        Assert.equals("Ä", Utf8Ext.toUpperCase("ä"));

        Assert.equals("Α", Utf8Ext.toUpperCase("α"));
        Assert.equals("Β", Utf8Ext.toUpperCase("β"));
        Assert.equals("Γ", Utf8Ext.toUpperCase("γ"));
        Assert.equals("Δ", Utf8Ext.toUpperCase("δ"));
        Assert.equals("Ε", Utf8Ext.toUpperCase("ε"));
        Assert.equals("Ζ", Utf8Ext.toUpperCase("ζ"));
        Assert.equals("Η", Utf8Ext.toUpperCase("η"));
        Assert.equals("Θ", Utf8Ext.toUpperCase("θ"));
        Assert.equals("Ι", Utf8Ext.toUpperCase("ι"));
        Assert.equals("Κ", Utf8Ext.toUpperCase("κ"));
        Assert.equals("Λ", Utf8Ext.toUpperCase("λ"));
        Assert.equals("Μ", Utf8Ext.toUpperCase("μ"));
        Assert.equals("Ν", Utf8Ext.toUpperCase("ν"));
        Assert.equals("Ξ", Utf8Ext.toUpperCase("ξ"));
        Assert.equals("Ο", Utf8Ext.toUpperCase("ο"));
        Assert.equals("Π", Utf8Ext.toUpperCase("π"));
        Assert.equals("Ρ", Utf8Ext.toUpperCase("ρ"));
        Assert.equals("Σ", Utf8Ext.toUpperCase("σ"));
        Assert.equals("Τ", Utf8Ext.toUpperCase("τ"));
        Assert.equals("Υ", Utf8Ext.toUpperCase("υ"));
        Assert.equals("Φ", Utf8Ext.toUpperCase("φ"));
        Assert.equals("Χ", Utf8Ext.toUpperCase("χ"));
        Assert.equals("Ψ", Utf8Ext.toUpperCase("ψ"));
        Assert.equals("Ω", Utf8Ext.toUpperCase("ω"));

        #if (!flash)
            // Flash = "΢"
            Assert.equals("Σ", Utf8Ext.toUpperCase("ς"));
        #end

        Assert.equals("Ά", Utf8Ext.toUpperCase("ά"));
        Assert.equals("Έ", Utf8Ext.toUpperCase("έ"));
        Assert.equals("Ή", Utf8Ext.toUpperCase("ή"));
        Assert.equals("Ί", Utf8Ext.toUpperCase("ί"));
        Assert.equals("Ό", Utf8Ext.toUpperCase("ό"));
        Assert.equals("Ύ", Utf8Ext.toUpperCase("ύ"));

        #if neko
            // Chrome = "Ϋ́", Firefox = "ΰ", Safari = "Ϋ́", Flash = "ΰ", Interp = "Ϋ"
            Assert.equals("Ϋ", Utf8Ext.toUpperCase("ΰ"));
        #end

        Assert.equals("Ϋ́", Utf8Ext.toUpperCase("ΰ"));
        Assert.equals("Ώ", Utf8Ext.toUpperCase("ώ"));
        Assert.equals("Ϊ", Utf8Ext.toUpperCase("ϊ"));
        Assert.equals("Ϊ́", Utf8Ext.toUpperCase("ΐ"));

        #if neko
            // Chrome = "Ϊ́", Firefox = "ΐ", Safari = "Ϊ́", Flash = "ΐ", Interp = "Ϊ"
            Assert.equals("Ϊ", Utf8Ext.toUpperCase("ΐ"));
        #end

        Assert.equals("Ϋ", Utf8Ext.toUpperCase("ϋ"));
    }
}
