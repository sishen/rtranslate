module Google
  module Language
    Languages = {
      'af' => 'AFRIKAANS',
      'sq' => 'ALBANIAN',
      'am' => 'AMHARIC',
      'ar' => 'ARABIC',
      'hy' => 'ARMENIAN',
      'az' => 'AZERBAIJANI',

      'eu' => 'BASQUE',
      'be' => 'BELARUSIAN',
      'bn' => 'BENGALI',
      'bh' => 'BIHARI',
      'bg' => 'BULGARIAN',
      'my' => 'BURMESE',

      'ca' => 'CATALAN',
      'chr' => 'CHEROKEE',
      'zh' => 'CHINESE',
      'zh-CN' => 'CHINESE_SIMPLIFIED',
      'zh-TW' => 'CHINESE_TRADITIONAL',
      'hr' => 'CROATIAN',
      'cs' => 'CZECH',

      'da' => 'DANISH',
      'dv' => 'DHIVEHI',
      'nl' => 'DUTCH',

      'en' => 'ENGLISH',
      'eo' => 'ESPERANTO',
      'et' => 'ESTONIAN',

      'tl' => 'FILIPINO',
      'fi' => 'FINNISH',
      'fr' => 'FRENCH',

      'gl' => 'GALICIAN',
      'ka' => 'GEORGIAN',
      'de' => 'GERMAN',
      'el' => 'GREEK',
      'gn' => 'GUARANI',
      'gu' => 'GUJARATI',

      'iw' => 'HEBREW',
      'hi' => 'HINDI',
      'hu' => 'HUNGARIAN',

      'is' => 'ICELANDIC',
      'id' => 'INDONESIAN',
      'iu' => 'INUKTITUT',
      'it' => 'ITALIAN',

      'ja' => 'JAPANESE',

      'kn' => 'KANNADA',
      'kk' => 'KAZAKH',
      'km' => 'KHMER',
      'ko' => 'KOREAN',
      'ku' => 'KURDISH',
      'ky' => 'KYRGYZ',

      'lo' => 'LAOTHIAN',
      'lv' => 'LATVIAN',
      'lt' => 'LITHUANIAN',

      'mk' => 'MACEDONIAN',
      'ms' => 'MALAY',
      'ml' => 'MALAYALAM',
      'mt' => 'MALTESE',
      'mr' => 'MARATHI',
      'mn' => 'MONGOLIAN',

      'ne' => 'NEPALI',
      'no' => 'NORWEGIAN',

      'or' => 'ORIYA',

      'ps' => 'PASHTO',
      'fa' => 'PERSIAN',
      'pl' => 'POLISH',
      'pt-PT' => 'PORTUGUESE',
      'pa' => 'PUNJABI',

      'ro' => 'ROMANIAN',
      'ru' => 'RUSSIAN',

      'sa' => 'SANSKRIT',
      'sr' => 'SERBIAN',
      'sd' => 'SINDHI',
      'si' => 'SINHALESE',
      'sk' => 'SLOVAK',
      'sl' => 'SLOVENIAN',
      'es' => 'SPANISH',
      'sw' => 'SWAHILI',
      'sv' => 'SWEDISH',

      'tg' => 'TAJIK',
      'ta' => 'TAMIL',
      'tl' => 'TAGALOG',
      'te' => 'TELUGU',
      'th' => 'THAI',
      'bo' => 'TIBETAN',
      'tr' => 'TURKISH',

      'uk' => 'UKRAINIAN',
      'ur' => 'URDU',
      'uz' => 'UZBEK',
      'ug' => 'UIGHUR',

      'vi' => 'VIETNAMESE',

      '' => 'UNKNOWN'
    }

    # judge whether the language is supported by google translate
    def supported?(language)
      if Languages.key?(language) || Languages.value?(language.upcase)
        true
      else
        false
      end
    end
    module_function :supported?

    # get the abbrev of the language
    def abbrev(language)
      if supported?(language)
        if Languages.key?(language)
          language
        else
          language.upcase!
          Languages.each do |k,v|
            if v == language
              return k
            end
          end
        end
      else
        nil
      end
    end
    module_function :abbrev
  end
end
