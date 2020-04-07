package test;

import org.zamedev.lib.Transliteration;
import utest.Assert;
import utest.Test;

class TransliterationTest extends Test {
    public function testBe() : Void {
        Assert.equals(
            "uladzimir-karatkievich-khrystos-pryziamliwsia-w-harodni",
            Transliteration.be("Уладзімір Караткевіч - Хрыстос Прызямліўся Ў Гародні")
        );
    }

    public function testRu() : Void {
        Assert.equals(
            "s-esh-zhe-eschyo-ehtikh-myagkikh-francuzskikh-bulok-da-vypej-chaju",
            Transliteration.ru("Съешь же ещё этих мягких французских булок да выпей чаю")
        );
    }
}
