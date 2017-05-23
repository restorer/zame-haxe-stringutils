package org.zamedev.lib.internal;

// Use org.zamedev.lib.tools.CaseMapsGenerator to generate this file

class Utf8ExtInternal {
	public static function fillUpperToLowerMap(map : Map<Int, Int>) : Void {
		var i = 0;
		for (i in 0...26) map[0x0041+i] = 0x0061+i; //A-Z => a-z
		for (i in 0...23) map[0x00C0+i] = 0x00E0+i; //À-Ö => à-ö
		for (i in 0...7) map[0x00D8+i] = 0x00F8+i; //Ø-Þ => ø-þ
		while (i < 48) { map[0x0100+i] = 0x0101+i; i += 2; } i = 0; //Ā-ė => ā-Ę
		map[0x0130] = 0x0069; //İ => i
		while (i < 6) { map[0x0132+i] = 0x0133+i; i += 2; } i = 0; //Ĳ-Ĵ => ĳ-ĵ
		while (i < 16) { map[0x0139+i] = 0x013A+i; i += 2; } i = 0; //Ĺ-ŀ => ĺ-Ł
		while (i < 46) { map[0x014A+i] = 0x014B+i; i += 2; } i = 0; //Ŋ-Š => ŋ-š
		map[0x0178] = 0x00FF; //Ÿ => ÿ
		while (i < 6) { map[0x0179+i] = 0x017A+i; i += 2; } i = 0; //Ź-Ż => ź-ż
		map[0x0181] = 0x0253; //Ɓ => ɓ
		while (i < 4) { map[0x0182+i] = 0x0183+i; i += 2; } i = 0; //Ƃ-ƃ => ƃ-Ƅ
		map[0x0186] = 0x0254; //Ɔ => ɔ
		map[0x0187] = 0x0188; //Ƈ => ƈ
		for (i in 0...2) map[0x0189+i] = 0x0256+i; //Ɖ-Ɗ => ɖ-ɗ
		map[0x018B] = 0x018C; //Ƌ => ƌ
		map[0x018E] = 0x01DD; //Ǝ => ǝ
		map[0x018F] = 0x0259; //Ə => ə
		map[0x0190] = 0x025B; //Ɛ => ɛ
		map[0x0191] = 0x0192; //Ƒ => ƒ
		map[0x0193] = 0x0260; //Ɠ => ɠ
		map[0x0194] = 0x0263; //Ɣ => ɣ
		map[0x0196] = 0x0269; //Ɩ => ɩ
		map[0x0197] = 0x0268; //Ɨ => ɨ
		map[0x0198] = 0x0199; //Ƙ => ƙ
		map[0x019C] = 0x026F; //Ɯ => ɯ
		map[0x019D] = 0x0272; //Ɲ => ɲ
		map[0x019F] = 0x0275; //Ɵ => ɵ
		while (i < 6) { map[0x01A0+i] = 0x01A1+i; i += 2; } i = 0; //Ơ-Ƣ => ơ-ƣ
		map[0x01A6] = 0x0280; //Ʀ => ʀ
		map[0x01A7] = 0x01A8; //Ƨ => ƨ
		map[0x01A9] = 0x0283; //Ʃ => ʃ
		map[0x01AC] = 0x01AD; //Ƭ => ƭ
		map[0x01AE] = 0x0288; //Ʈ => ʈ
		map[0x01AF] = 0x01B0; //Ư => ư
		for (i in 0...2) map[0x01B1+i] = 0x028A+i; //Ʊ-Ʋ => ʊ-ʋ
		while (i < 4) { map[0x01B3+i] = 0x01B4+i; i += 2; } i = 0; //Ƴ-ƴ => ƴ-Ƶ
		map[0x01B7] = 0x0292; //Ʒ => ʒ
		map[0x01B8] = 0x01B9; //Ƹ => ƹ
		map[0x01BC] = 0x01BD; //Ƽ => ƽ
		map[0x01C4] = 0x01C6; //Ǆ => ǆ
		map[0x01C7] = 0x01C9; //Ǉ => ǉ
		map[0x01CA] = 0x01CC; //Ǌ => ǌ
		while (i < 16) { map[0x01CD+i] = 0x01CE+i; i += 2; } i = 0; //Ǎ-ǔ => ǎ-Ǖ
		while (i < 18) { map[0x01DE+i] = 0x01DF+i; i += 2; } i = 0; //Ǟ-Ǧ => ǟ-ǧ
		map[0x01F1] = 0x01F3; //Ǳ => ǳ
		map[0x01F4] = 0x01F5; //Ǵ => ǵ
		map[0x01F6] = 0x0195; //Ƕ => ƕ
		map[0x01F7] = 0x01BF; //Ƿ => ƿ
		while (i < 40) { map[0x01F8+i] = 0x01F9+i; i += 2; } i = 0; //Ǹ-ȋ => ǹ-Ȍ
		map[0x0220] = 0x019E; //Ƞ => ƞ
		while (i < 18) { map[0x0222+i] = 0x0223+i; i += 2; } i = 0; //Ȣ-Ȫ => ȣ-ȫ
		map[0x023A] = 0x2C65; //Ⱥ => ⱥ
		map[0x023B] = 0x023C; //Ȼ => ȼ
		map[0x023D] = 0x019A; //Ƚ => ƚ
		map[0x023E] = 0x2C66; //Ⱦ => ⱦ
		map[0x0241] = 0x0242; //Ɂ => ɂ
		map[0x0243] = 0x0180; //Ƀ => ƀ
		map[0x0244] = 0x0289; //Ʉ => ʉ
		map[0x0245] = 0x028C; //Ʌ => ʌ
		while (i < 10) { map[0x0246+i] = 0x0247+i; i += 2; } i = 0; //Ɇ-Ɋ => ɇ-ɋ
		while (i < 4) { map[0x0370+i] = 0x0371+i; i += 2; } i = 0; //Ͱ-ͱ => ͱ-Ͳ
		map[0x0376] = 0x0377; //Ͷ => ͷ
		map[0x037F] = 0x03F3; //Ϳ => ϳ
		map[0x0386] = 0x03AC; //Ά => ά
		for (i in 0...3) map[0x0388+i] = 0x03AD+i; //Έ-Ί => έ-ί
		map[0x038C] = 0x03CC; //Ό => ό
		for (i in 0...2) map[0x038E+i] = 0x03CD+i; //Ύ-Ώ => ύ-ώ
		for (i in 0...17) map[0x0391+i] = 0x03B1+i; //Α-Ρ => α-ρ
		for (i in 0...9) map[0x03A3+i] = 0x03C3+i; //Σ-Ϋ => σ-ϋ
		map[0x03CF] = 0x03D7; //Ϗ => ϗ
		while (i < 24) { map[0x03D8+i] = 0x03D9+i; i += 2; } i = 0; //Ϙ-ϣ => ϙ-Ϥ
		map[0x03F4] = 0x03B8; //ϴ => θ
		map[0x03F7] = 0x03F8; //Ϸ => ϸ
		map[0x03F9] = 0x03F2; //Ϲ => ϲ
		map[0x03FA] = 0x03FB; //Ϻ => ϻ
		for (i in 0...3) map[0x03FD+i] = 0x037B+i; //Ͻ-Ͽ => ͻ-ͽ
		for (i in 0...16) map[0x0400+i] = 0x0450+i; //Ѐ-Џ => ѐ-џ
		for (i in 0...32) map[0x0410+i] = 0x0430+i; //А-Я => а-я
		while (i < 34) { map[0x0460+i] = 0x0461+i; i += 2; } i = 0; //Ѡ-Ѱ => ѡ-ѱ
		while (i < 54) { map[0x048A+i] = 0x048B+i; i += 2; } i = 0; //Ҋ-Ҥ => ҋ-ҥ
		map[0x04C0] = 0x04CF; //Ӏ => ӏ
		while (i < 14) { map[0x04C1+i] = 0x04C2+i; i += 2; } i = 0; //Ӂ-Ӈ => ӂ-ӈ
		while (i < 96) { map[0x04D0+i] = 0x04D1+i; i += 2; } i = 0; //Ӑ-ӿ => ӑ-Ԁ
		for (i in 0...38) map[0x0531+i] = 0x0561+i; //Ա-Ֆ => ա-ֆ
		for (i in 0...38) map[0x10A0+i] = 0x2D00+i; //Ⴀ-Ⴥ => ⴀ-ⴥ
		map[0x10C7] = 0x2D27; //Ⴧ => ⴧ
		map[0x10CD] = 0x2D2D; //Ⴭ => ⴭ
		for (i in 0...80) map[0x13A0+i] = 0xAB70+i; //Ꭰ-Ꮿ => ꭰ-ꮿ
		for (i in 0...6) map[0x13F0+i] = 0x13F8+i; //Ᏸ-Ᏽ => ᏸ-ᏽ
		while (i < 150) { map[0x1E00+i] = 0x1E01+i; i += 2; } i = 0; //Ḁ-Ṋ => ḁ-ṋ
		map[0x1E9E] = 0x00DF; //ẞ => ß
		while (i < 96) { map[0x1EA0+i] = 0x1EA1+i; i += 2; } i = 0; //Ạ-ỏ => ạ-Ố
		for (i in 0...8) map[0x1F08+i] = 0x1F00+i; //Ἀ-Ἇ => ἀ-ἇ
		for (i in 0...6) map[0x1F18+i] = 0x1F10+i; //Ἐ-Ἕ => ἐ-ἕ
		for (i in 0...8) map[0x1F28+i] = 0x1F20+i; //Ἠ-Ἧ => ἠ-ἧ
		for (i in 0...8) map[0x1F38+i] = 0x1F30+i; //Ἰ-Ἷ => ἰ-ἷ
		for (i in 0...6) map[0x1F48+i] = 0x1F40+i; //Ὀ-Ὅ => ὀ-ὅ
		while (i < 8) { map[0x1F59+i] = 0x1F51+i; i += 2; } i = 0; //Ὑ-὜ => ὑ-ὔ
		for (i in 0...8) map[0x1F68+i] = 0x1F60+i; //Ὠ-Ὧ => ὠ-ὧ
		for (i in 0...2) map[0x1FB8+i] = 0x1FB0+i; //Ᾰ-Ᾱ => ᾰ-ᾱ
		for (i in 0...2) map[0x1FBA+i] = 0x1F70+i; //Ὰ-Ά => ὰ-ά
		for (i in 0...4) map[0x1FC8+i] = 0x1F72+i; //Ὲ-Ή => ὲ-ή
		for (i in 0...2) map[0x1FD8+i] = 0x1FD0+i; //Ῐ-Ῑ => ῐ-ῑ
		for (i in 0...2) map[0x1FDA+i] = 0x1F76+i; //Ὶ-Ί => ὶ-ί
		for (i in 0...2) map[0x1FE8+i] = 0x1FE0+i; //Ῠ-Ῡ => ῠ-ῡ
		for (i in 0...2) map[0x1FEA+i] = 0x1F7A+i; //Ὺ-Ύ => ὺ-ύ
		map[0x1FEC] = 0x1FE5; //Ῥ => ῥ
		for (i in 0...2) map[0x1FF8+i] = 0x1F78+i; //Ὸ-Ό => ὸ-ό
		for (i in 0...2) map[0x1FFA+i] = 0x1F7C+i; //Ὼ-Ώ => ὼ-ώ
		map[0x2126] = 0x03C9; //Ω => ω
		map[0x212A] = 0x006B; //K => k
		map[0x212B] = 0x00E5; //Å => å
		map[0x2132] = 0x214E; //Ⅎ => ⅎ
		map[0x2183] = 0x2184; //Ↄ => ↄ
		for (i in 0...47) map[0x2C00+i] = 0x2C30+i; //Ⰰ-Ⱞ => ⰰ-ⱞ
		map[0x2C60] = 0x2C61; //Ⱡ => ⱡ
		map[0x2C62] = 0x026B; //Ɫ => ɫ
		map[0x2C63] = 0x1D7D; //Ᵽ => ᵽ
		map[0x2C64] = 0x027D; //Ɽ => ɽ
		while (i < 6) { map[0x2C67+i] = 0x2C68+i; i += 2; } i = 0; //Ⱨ-Ⱪ => ⱨ-ⱪ
		map[0x2C6D] = 0x0251; //Ɑ => ɑ
		map[0x2C6E] = 0x0271; //Ɱ => ɱ
		map[0x2C6F] = 0x0250; //Ɐ => ɐ
		map[0x2C70] = 0x0252; //Ɒ => ɒ
		map[0x2C72] = 0x2C73; //Ⱳ => ⱳ
		map[0x2C75] = 0x2C76; //Ⱶ => ⱶ
		for (i in 0...2) map[0x2C7E+i] = 0x023F+i; //Ȿ-Ɀ => ȿ-ɀ
		while (i < 100) { map[0x2C80+i] = 0x2C81+i; i += 2; } i = 0; //Ⲁ-ⲱ => ⲁ-Ⲳ
		while (i < 4) { map[0x2CEB+i] = 0x2CEC+i; i += 2; } i = 0; //Ⳬ-ⳬ => ⳬ-Ⳮ
		map[0x2CF2] = 0x2CF3; //Ⳳ => ⳳ
		while (i < 46) { map[0xA640+i] = 0xA641+i; i += 2; } i = 0; //Ꙁ-Ꙗ => ꙁ-ꙗ
		while (i < 28) { map[0xA680+i] = 0xA681+i; i += 2; } i = 0; //Ꚁ-ꚍ => ꚁ-Ꚏ
		while (i < 14) { map[0xA722+i] = 0xA723+i; i += 2; } i = 0; //Ꜣ-Ꜩ => ꜣ-ꜩ
		while (i < 62) { map[0xA732+i] = 0xA733+i; i += 2; } i = 0; //Ꜳ-Ꝑ => ꜳ-ꝑ
		while (i < 4) { map[0xA779+i] = 0xA77A+i; i += 2; } i = 0; //Ꝺ-ꝺ => ꝺ-Ꝼ
		map[0xA77D] = 0x1D79; //Ᵹ => ᵹ
		while (i < 10) { map[0xA77E+i] = 0xA77F+i; i += 2; } i = 0; //Ꝿ-Ꞃ => ꝿ-ꞃ
		map[0xA78B] = 0xA78C; //Ꞌ => ꞌ
		map[0xA78D] = 0x0265; //Ɥ => ɥ
		while (i < 4) { map[0xA790+i] = 0xA791+i; i += 2; } i = 0; //Ꞑ-ꞑ => ꞑ-Ꞓ
		while (i < 20) { map[0xA796+i] = 0xA797+i; i += 2; } i = 0; //Ꞗ-ꞟ => ꞗ-Ꞡ
		map[0xA7AA] = 0x0266; //Ɦ => ɦ
		map[0xA7AB] = 0x025C; //Ɜ => ɜ
		map[0xA7AC] = 0x0261; //Ɡ => ɡ
		map[0xA7AD] = 0x026C; //Ɬ => ɬ
		map[0xA7AE] = 0x026A; //Ɪ => ɪ
		map[0xA7B0] = 0x029E; //Ʞ => ʞ
		map[0xA7B1] = 0x0287; //Ʇ => ʇ
		map[0xA7B2] = 0x029D; //Ʝ => ʝ
		map[0xA7B3] = 0xAB53; //Ꭓ => ꭓ
		while (i < 4) { map[0xA7B4+i] = 0xA7B5+i; i += 2; } i = 0; //Ꞵ-ꞵ => ꞵ-Ꞷ
		for (i in 0...26) map[0xFF21+i] = 0xFF41+i; //Ａ-Ｚ => ａ-ｚ
		for (i in 0...40) map[0x10400+i] = 0x10428+i; //𐐀-𐐧 => 𐐨-𐑏
		for (i in 0...36) map[0x104B0+i] = 0x104D8+i; //𐒰-𐓓 => 𐓘-𐓻
		for (i in 0...51) map[0x10C80+i] = 0x10CC0+i; //𐲀-𐲲 => 𐳀-𐳲
		for (i in 0...32) map[0x118A0+i] = 0x118C0+i; //𑢠-𑢿 => 𑣀-𑣟
		for (i in 0...34) map[0x1E900+i] = 0x1E922+i; //𞤀-𞤡 => 𞤢-𞥃
	}

	public static function fillLowerToUpperMap(map : Map<Int, Int>) : Void {
		var i = 0;
		for (i in 0...26) map[0x0061+i] = 0x0041+i; //a-z => A-Z
		map[0x00B5] = 0x039C; //µ => Μ
		for (i in 0...23) map[0x00E0+i] = 0x00C0+i; //à-ö => À-Ö
		for (i in 0...7) map[0x00F8+i] = 0x00D8+i; //ø-þ => Ø-Þ
		map[0x00FF] = 0x0178; //ÿ => Ÿ
		while (i < 48) { map[0x0101+i] = 0x0100+i; i += 2; } i = 0; //ā-Ę => Ā-ė
		map[0x0131] = 0x0049; //ı => I
		while (i < 6) { map[0x0133+i] = 0x0132+i; i += 2; } i = 0; //ĳ-ĵ => Ĳ-Ĵ
		while (i < 16) { map[0x013A+i] = 0x0139+i; i += 2; } i = 0; //ĺ-Ł => Ĺ-ŀ
		while (i < 46) { map[0x014B+i] = 0x014A+i; i += 2; } i = 0; //ŋ-š => Ŋ-Š
		while (i < 6) { map[0x017A+i] = 0x0179+i; i += 2; } i = 0; //ź-ż => Ź-Ż
		map[0x017F] = 0x0053; //ſ => S
		map[0x0180] = 0x0243; //ƀ => Ƀ
		while (i < 4) { map[0x0183+i] = 0x0182+i; i += 2; } i = 0; //ƃ-Ƅ => Ƃ-ƃ
		map[0x0188] = 0x0187; //ƈ => Ƈ
		map[0x018C] = 0x018B; //ƌ => Ƌ
		map[0x0192] = 0x0191; //ƒ => Ƒ
		map[0x0195] = 0x01F6; //ƕ => Ƕ
		map[0x0199] = 0x0198; //ƙ => Ƙ
		map[0x019A] = 0x023D; //ƚ => Ƚ
		map[0x019E] = 0x0220; //ƞ => Ƞ
		while (i < 6) { map[0x01A1+i] = 0x01A0+i; i += 2; } i = 0; //ơ-ƣ => Ơ-Ƣ
		map[0x01A8] = 0x01A7; //ƨ => Ƨ
		map[0x01AD] = 0x01AC; //ƭ => Ƭ
		map[0x01B0] = 0x01AF; //ư => Ư
		while (i < 4) { map[0x01B4+i] = 0x01B3+i; i += 2; } i = 0; //ƴ-Ƶ => Ƴ-ƴ
		map[0x01B9] = 0x01B8; //ƹ => Ƹ
		map[0x01BD] = 0x01BC; //ƽ => Ƽ
		map[0x01BF] = 0x01F7; //ƿ => Ƿ
		map[0x01C6] = 0x01C4; //ǆ => Ǆ
		map[0x01C9] = 0x01C7; //ǉ => Ǉ
		map[0x01CC] = 0x01CA; //ǌ => Ǌ
		while (i < 16) { map[0x01CE+i] = 0x01CD+i; i += 2; } i = 0; //ǎ-Ǖ => Ǎ-ǔ
		map[0x01DD] = 0x018E; //ǝ => Ǝ
		while (i < 18) { map[0x01DF+i] = 0x01DE+i; i += 2; } i = 0; //ǟ-ǧ => Ǟ-Ǧ
		map[0x01F0] = 0x004A; //ǰ => J
		map[0x01F3] = 0x01F1; //ǳ => Ǳ
		map[0x01F5] = 0x01F4; //ǵ => Ǵ
		while (i < 40) { map[0x01F9+i] = 0x01F8+i; i += 2; } i = 0; //ǹ-Ȍ => Ǹ-ȋ
		while (i < 18) { map[0x0223+i] = 0x0222+i; i += 2; } i = 0; //ȣ-ȫ => Ȣ-Ȫ
		map[0x023C] = 0x023B; //ȼ => Ȼ
		for (i in 0...2) map[0x023F+i] = 0x2C7E+i; //ȿ-ɀ => Ȿ-Ɀ
		map[0x0242] = 0x0241; //ɂ => Ɂ
		while (i < 10) { map[0x0247+i] = 0x0246+i; i += 2; } i = 0; //ɇ-ɋ => Ɇ-Ɋ
		map[0x0250] = 0x2C6F; //ɐ => Ɐ
		map[0x0251] = 0x2C6D; //ɑ => Ɑ
		map[0x0252] = 0x2C70; //ɒ => Ɒ
		map[0x0253] = 0x0181; //ɓ => Ɓ
		map[0x0254] = 0x0186; //ɔ => Ɔ
		for (i in 0...2) map[0x0256+i] = 0x0189+i; //ɖ-ɗ => Ɖ-Ɗ
		map[0x0259] = 0x018F; //ə => Ə
		map[0x025B] = 0x0190; //ɛ => Ɛ
		map[0x025C] = 0xA7AB; //ɜ => Ɜ
		map[0x0260] = 0x0193; //ɠ => Ɠ
		map[0x0261] = 0xA7AC; //ɡ => Ɡ
		map[0x0263] = 0x0194; //ɣ => Ɣ
		map[0x0265] = 0xA78D; //ɥ => Ɥ
		map[0x0266] = 0xA7AA; //ɦ => Ɦ
		map[0x0268] = 0x0197; //ɨ => Ɨ
		map[0x0269] = 0x0196; //ɩ => Ɩ
		map[0x026A] = 0xA7AE; //ɪ => Ɪ
		map[0x026B] = 0x2C62; //ɫ => Ɫ
		map[0x026C] = 0xA7AD; //ɬ => Ɬ
		map[0x026F] = 0x019C; //ɯ => Ɯ
		map[0x0271] = 0x2C6E; //ɱ => Ɱ
		map[0x0272] = 0x019D; //ɲ => Ɲ
		map[0x0275] = 0x019F; //ɵ => Ɵ
		map[0x027D] = 0x2C64; //ɽ => Ɽ
		map[0x0280] = 0x01A6; //ʀ => Ʀ
		map[0x0283] = 0x01A9; //ʃ => Ʃ
		map[0x0287] = 0xA7B1; //ʇ => Ʇ
		map[0x0288] = 0x01AE; //ʈ => Ʈ
		map[0x0289] = 0x0244; //ʉ => Ʉ
		for (i in 0...2) map[0x028A+i] = 0x01B1+i; //ʊ-ʋ => Ʊ-Ʋ
		map[0x028C] = 0x0245; //ʌ => Ʌ
		map[0x0292] = 0x01B7; //ʒ => Ʒ
		map[0x029D] = 0xA7B2; //ʝ => Ʝ
		map[0x029E] = 0xA7B0; //ʞ => Ʞ
		while (i < 4) { map[0x0371+i] = 0x0370+i; i += 2; } i = 0; //ͱ-Ͳ => Ͱ-ͱ
		map[0x0377] = 0x0376; //ͷ => Ͷ
		for (i in 0...3) map[0x037B+i] = 0x03FD+i; //ͻ-ͽ => Ͻ-Ͽ
		map[0x0390] = 0x03AA; //ΐ => Ϊ
		map[0x03AC] = 0x0386; //ά => Ά
		for (i in 0...3) map[0x03AD+i] = 0x0388+i; //έ-ί => Έ-Ί
		map[0x03B0] = 0x03AB; //ΰ => Ϋ
		for (i in 0...17) map[0x03B1+i] = 0x0391+i; //α-ρ => Α-Ρ
		map[0x03C2] = 0x03A3; //ς => Σ
		for (i in 0...9) map[0x03C3+i] = 0x03A3+i; //σ-ϋ => Σ-Ϋ
		map[0x03CC] = 0x038C; //ό => Ό
		for (i in 0...2) map[0x03CD+i] = 0x038E+i; //ύ-ώ => Ύ-Ώ
		map[0x03D0] = 0x0392; //ϐ => Β
		map[0x03D1] = 0x0398; //ϑ => Θ
		map[0x03D5] = 0x03A6; //ϕ => Φ
		map[0x03D6] = 0x03A0; //ϖ => Π
		map[0x03D7] = 0x03CF; //ϗ => Ϗ
		while (i < 24) { map[0x03D9+i] = 0x03D8+i; i += 2; } i = 0; //ϙ-Ϥ => Ϙ-ϣ
		map[0x03F0] = 0x039A; //ϰ => Κ
		map[0x03F1] = 0x03A1; //ϱ => Ρ
		map[0x03F2] = 0x03F9; //ϲ => Ϲ
		map[0x03F3] = 0x037F; //ϳ => Ϳ
		map[0x03F5] = 0x0395; //ϵ => Ε
		map[0x03F8] = 0x03F7; //ϸ => Ϸ
		map[0x03FB] = 0x03FA; //ϻ => Ϻ
		for (i in 0...32) map[0x0430+i] = 0x0410+i; //а-я => А-Я
		for (i in 0...16) map[0x0450+i] = 0x0400+i; //ѐ-џ => Ѐ-Џ
		while (i < 34) { map[0x0461+i] = 0x0460+i; i += 2; } i = 0; //ѡ-ѱ => Ѡ-Ѱ
		while (i < 54) { map[0x048B+i] = 0x048A+i; i += 2; } i = 0; //ҋ-ҥ => Ҋ-Ҥ
		while (i < 14) { map[0x04C2+i] = 0x04C1+i; i += 2; } i = 0; //ӂ-ӈ => Ӂ-Ӈ
		map[0x04CF] = 0x04C0; //ӏ => Ӏ
		while (i < 96) { map[0x04D1+i] = 0x04D0+i; i += 2; } i = 0; //ӑ-Ԁ => Ӑ-ӿ
		for (i in 0...38) map[0x0561+i] = 0x0531+i; //ա-ֆ => Ա-Ֆ
		for (i in 0...6) map[0x13F8+i] = 0x13F0+i; //ᏸ-ᏽ => Ᏸ-Ᏽ
		map[0x1C80] = 0x0412; //ᲀ => В
		map[0x1C81] = 0x0414; //ᲁ => Д
		map[0x1C82] = 0x041E; //ᲂ => О
		for (i in 0...2) map[0x1C83+i] = 0x0421+i; //ᲃ-ᲄ => С-Т
		map[0x1C85] = 0x0422; //ᲅ => Т
		map[0x1C86] = 0x042A; //ᲆ => Ъ
		map[0x1C87] = 0x0462; //ᲇ => Ѣ
		map[0x1C88] = 0xA64A; //ᲈ => Ꙋ
		map[0x1D79] = 0xA77D; //ᵹ => Ᵹ
		map[0x1D7D] = 0x2C63; //ᵽ => Ᵽ
		while (i < 150) { map[0x1E01+i] = 0x1E00+i; i += 2; } i = 0; //ḁ-ṋ => Ḁ-Ṋ
		map[0x1E96] = 0x0048; //ẖ => H
		map[0x1E97] = 0x0054; //ẗ => T
		map[0x1E98] = 0x0057; //ẘ => W
		map[0x1E99] = 0x0059; //ẙ => Y
		map[0x1E9B] = 0x1E60; //ẛ => Ṡ
		while (i < 96) { map[0x1EA1+i] = 0x1EA0+i; i += 2; } i = 0; //ạ-Ố => Ạ-ỏ
		for (i in 0...8) map[0x1F00+i] = 0x1F08+i; //ἀ-ἇ => Ἀ-Ἇ
		for (i in 0...6) map[0x1F10+i] = 0x1F18+i; //ἐ-ἕ => Ἐ-Ἕ
		for (i in 0...8) map[0x1F20+i] = 0x1F28+i; //ἠ-ἧ => Ἠ-Ἧ
		for (i in 0...8) map[0x1F30+i] = 0x1F38+i; //ἰ-ἷ => Ἰ-Ἷ
		for (i in 0...6) map[0x1F40+i] = 0x1F48+i; //ὀ-ὅ => Ὀ-Ὅ
		map[0x1F50] = 0x03A5; //ὐ => Υ
		map[0x1F51] = 0x1F59; //ὑ => Ὑ
		map[0x1F52] = 0x03A5; //ὒ => Υ
		map[0x1F53] = 0x1F5B; //ὓ => Ὓ
		map[0x1F54] = 0x03A5; //ὔ => Υ
		map[0x1F55] = 0x1F5D; //ὕ => Ὕ
		map[0x1F56] = 0x03A5; //ὖ => Υ
		map[0x1F57] = 0x1F5F; //ὗ => Ὗ
		for (i in 0...8) map[0x1F60+i] = 0x1F68+i; //ὠ-ὧ => Ὠ-Ὧ
		for (i in 0...2) map[0x1F70+i] = 0x1FBA+i; //ὰ-ά => Ὰ-Ά
		for (i in 0...4) map[0x1F72+i] = 0x1FC8+i; //ὲ-ή => Ὲ-Ή
		for (i in 0...2) map[0x1F76+i] = 0x1FDA+i; //ὶ-ί => Ὶ-Ί
		for (i in 0...2) map[0x1F78+i] = 0x1FF8+i; //ὸ-ό => Ὸ-Ό
		for (i in 0...2) map[0x1F7A+i] = 0x1FEA+i; //ὺ-ύ => Ὺ-Ύ
		for (i in 0...2) map[0x1F7C+i] = 0x1FFA+i; //ὼ-ώ => Ὼ-Ώ
		for (i in 0...8) map[0x1F80+i] = 0x1F88+i; //ᾀ-ᾇ => ᾈ-ᾏ
		for (i in 0...8) map[0x1F90+i] = 0x1F98+i; //ᾐ-ᾗ => ᾘ-ᾟ
		for (i in 0...8) map[0x1FA0+i] = 0x1FA8+i; //ᾠ-ᾧ => ᾨ-ᾯ
		for (i in 0...3) map[0x1FB0+i] = 0x1FB8+i; //ᾰ-ᾲ => Ᾰ-Ὰ
		map[0x1FB3] = 0x1FBC; //ᾳ => ᾼ
		map[0x1FB4] = 0x0386; //ᾴ => Ά
		map[0x1FB6] = 0x0391; //ᾶ => Α
		map[0x1FB7] = 0x0391; //ᾷ => Α
		map[0x1FBE] = 0x0399; //ι => Ι
		map[0x1FC2] = 0x1FCA; //ῂ => Ὴ
		map[0x1FC3] = 0x1FCC; //ῃ => ῌ
		map[0x1FC4] = 0x0389; //ῄ => Ή
		map[0x1FC6] = 0x0397; //ῆ => Η
		map[0x1FC7] = 0x0397; //ῇ => Η
		for (i in 0...2) map[0x1FD0+i] = 0x1FD8+i; //ῐ-ῑ => Ῐ-Ῑ
		map[0x1FD2] = 0x03AA; //ῒ => Ϊ
		map[0x1FD3] = 0x03AA; //ΐ => Ϊ
		map[0x1FD6] = 0x0399; //ῖ => Ι
		map[0x1FD7] = 0x03AA; //ῗ => Ϊ
		for (i in 0...2) map[0x1FE0+i] = 0x1FE8+i; //ῠ-ῡ => Ῠ-Ῡ
		map[0x1FE2] = 0x03AB; //ῢ => Ϋ
		map[0x1FE3] = 0x03AB; //ΰ => Ϋ
		map[0x1FE4] = 0x03A1; //ῤ => Ρ
		map[0x1FE5] = 0x1FEC; //ῥ => Ῥ
		map[0x1FE6] = 0x03A5; //ῦ => Υ
		map[0x1FE7] = 0x03AB; //ῧ => Ϋ
		map[0x1FF2] = 0x1FFA; //ῲ => Ὼ
		map[0x1FF3] = 0x1FFC; //ῳ => ῼ
		map[0x1FF4] = 0x038F; //ῴ => Ώ
		map[0x1FF6] = 0x03A9; //ῶ => Ω
		map[0x1FF7] = 0x03A9; //ῷ => Ω
		map[0x214E] = 0x2132; //ⅎ => Ⅎ
		map[0x2184] = 0x2183; //ↄ => Ↄ
		for (i in 0...47) map[0x2C30+i] = 0x2C00+i; //ⰰ-ⱞ => Ⰰ-Ⱞ
		map[0x2C61] = 0x2C60; //ⱡ => Ⱡ
		map[0x2C65] = 0x023A; //ⱥ => Ⱥ
		map[0x2C66] = 0x023E; //ⱦ => Ⱦ
		while (i < 6) { map[0x2C68+i] = 0x2C67+i; i += 2; } i = 0; //ⱨ-ⱪ => Ⱨ-Ⱪ
		map[0x2C73] = 0x2C72; //ⱳ => Ⱳ
		map[0x2C76] = 0x2C75; //ⱶ => Ⱶ
		while (i < 100) { map[0x2C81+i] = 0x2C80+i; i += 2; } i = 0; //ⲁ-Ⲳ => Ⲁ-ⲱ
		while (i < 4) { map[0x2CEC+i] = 0x2CEB+i; i += 2; } i = 0; //ⳬ-Ⳮ => Ⳬ-ⳬ
		map[0x2CF3] = 0x2CF2; //ⳳ => Ⳳ
		for (i in 0...38) map[0x2D00+i] = 0x10A0+i; //ⴀ-ⴥ => Ⴀ-Ⴥ
		map[0x2D27] = 0x10C7; //ⴧ => Ⴧ
		map[0x2D2D] = 0x10CD; //ⴭ => Ⴭ
		while (i < 46) { map[0xA641+i] = 0xA640+i; i += 2; } i = 0; //ꙁ-ꙗ => Ꙁ-Ꙗ
		while (i < 28) { map[0xA681+i] = 0xA680+i; i += 2; } i = 0; //ꚁ-Ꚏ => Ꚁ-ꚍ
		while (i < 14) { map[0xA723+i] = 0xA722+i; i += 2; } i = 0; //ꜣ-ꜩ => Ꜣ-Ꜩ
		while (i < 62) { map[0xA733+i] = 0xA732+i; i += 2; } i = 0; //ꜳ-ꝑ => Ꜳ-Ꝑ
		while (i < 4) { map[0xA77A+i] = 0xA779+i; i += 2; } i = 0; //ꝺ-Ꝼ => Ꝺ-ꝺ
		while (i < 10) { map[0xA77F+i] = 0xA77E+i; i += 2; } i = 0; //ꝿ-ꞃ => Ꝿ-Ꞃ
		map[0xA78C] = 0xA78B; //ꞌ => Ꞌ
		while (i < 4) { map[0xA791+i] = 0xA790+i; i += 2; } i = 0; //ꞑ-Ꞓ => Ꞑ-ꞑ
		while (i < 20) { map[0xA797+i] = 0xA796+i; i += 2; } i = 0; //ꞗ-Ꞡ => Ꞗ-ꞟ
		while (i < 4) { map[0xA7B5+i] = 0xA7B4+i; i += 2; } i = 0; //ꞵ-Ꞷ => Ꞵ-ꞵ
		map[0xAB53] = 0xA7B3; //ꭓ => Ꭓ
		for (i in 0...80) map[0xAB70+i] = 0x13A0+i; //ꭰ-ꮿ => Ꭰ-Ꮿ
		for (i in 0...26) map[0xFF41+i] = 0xFF21+i; //ａ-ｚ => Ａ-Ｚ
		for (i in 0...40) map[0x10428+i] = 0x10400+i; //𐐨-𐑏 => 𐐀-𐐧
		for (i in 0...36) map[0x104D8+i] = 0x104B0+i; //𐓘-𐓻 => 𐒰-𐓓
		for (i in 0...51) map[0x10CC0+i] = 0x10C80+i; //𐳀-𐳲 => 𐲀-𐲲
		for (i in 0...32) map[0x118C0+i] = 0x118A0+i; //𑣀-𑣟 => 𑢠-𑢿
		for (i in 0...34) map[0x1E922+i] = 0x1E900+i; //𞤢-𞥃 => 𞤀-𞤡
	}
}
