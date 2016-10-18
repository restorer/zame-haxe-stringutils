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

Allows you to generate cool-looking SEO-friendly URL from string on belarusian language.

```haxe
trace(Transliteration.be("Уладзімір Караткевіч - Хрыстос Прызямліўся Ў Гародні"));
```

will give you `uladzimir-karatkievich-khrystos-pryziamliwsia-w-harodni`

## Product support

This library is finished. Later I have plant to merge several smaller libraries into bigger one.

| Feature | Support status |
|---|---|
| New features | No |
| Non-critical bugfixes | No |
| Critical bugfixes | Yes |
| Pull requests | Accepted (after review) |
| Issues | Monitored, but if you want to change something - submit a pull request |
| OpenFL version planned to support | Up to 4.x, and probably later |
| Estimated end-of-life | Up to 2017 (new library will be created later) |

### Roadmap for future

  - [ ] Add russian language support to Transliteration class
