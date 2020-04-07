package ;

import utest.UTest;

class TestSuite {
    public static function main() {
        UTest.run([
            new test.CaseMapsGeneratorTest(),
            new test.Utf8ExtTest(),
            new test.TransliterationTest(),
        ]);
    }
}
