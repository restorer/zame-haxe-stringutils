# String utils for Haxe

  - Utf8Ext
  - Transliteration

[About](http://blog.zame-dev.org/5-more-things-i-dont-like-in-haxe-and-how-to-fix-them/)

## Installation

```
haxelib git zame-stringutils https://github.com/restorer/zame-haxe-stringutils.git
```

### Utf8Ext

Haxe have excellent `haxe.Utf8` class, which allows us to work with utf-8 in a cross-platform way.

But what about cross-platform `toLowerCase()` or `toUpperCase()`? What regular expression should I write to replace all non-letters (including unicode ones) with, say, spaces?

`Utf8Ext` will take care about this on `neko`, `cpp` and `php`, with fallback to native implementation for other platforms.

  - Use `Utf8Ext.toLoweCase()` to convert utf-8 string to lover case, across all platforms.
  - Use `Utf8Ext.toUpperCase()` to convert utf-8 string to upper case, across all platforms.
  - Use `Utf8Ext.getUnicodeRe()` to get regular expression that matches all characters, including unicode (like `/[\p{L}]/` in PCRE).
  - Use `Utf8Ext.getUnicodeRe("^")` to get regular expression that matches all non-characters (like `/[\P{L}]/` in PCRE).
  - `Utf8Ext.getUnicodeRe("0-9")` will match numbers and characters, while `Utf8Ext.getUnicodeRe("^0-9")` will match anything, except numbers and characters.

### Transliteration

Allows you to generate cool-looking SEO-friendly URL from string on belarusian or russian language.

```haxe
trace(Transliteration.be("Уладзімір Караткевіч - Хрыстос Прызямліўся Ў Гародні"));
```

will give you `uladzimir-karatkievich-khrystos-pryziamliwsia-w-harodni`, and

```haxe
trace(Transliteration.ru("Съешь же ещё этих мягких французских булок да выпей чаю"));
```

will give you `s-esh-zhe-eschyo-ehtikh-myagkikh-francuzskikh-bulok-da-vypej-chaju`.

## Product support

This library is finished. Later I have plant to merge several smaller libraries into bigger one.

| Feature | Support status |
|---|---|
| New features | No |
| Non-critical bugfixes | No |
| Critical bugfixes | Yes |
| Pull requests | Accepted (after review) |
| Issues | Monitored, but if you want to change something - submit a pull request |
| Estimated end-of-life | Up to 2017 (new library will be created later) |

## Runnint tests

```
cd tests
haxelib run munit test
```

To run tests for specific target:

  - `haxelib run munit test -neko`
  - `haxelib run munit test -cpp`
  - `haxelib run munit test -js`
  - `haxelib run munit test -as3`

### Roadmap for future

  - [x] Add russian language support to Transliteration class
