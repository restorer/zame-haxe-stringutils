package ;

import org.zamedev.lib.Transliteration;

class TransliterationSample {
    public static function main() {
        trace(Transliteration.be("Уладзімір Караткевіч - Хрыстос Прызямліўся Ў Гародні"));
        trace(Transliteration.ru("Съешь же ещё этих мягких французских булок да выпей чаю"));
    }
}
