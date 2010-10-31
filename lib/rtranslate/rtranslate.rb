# The program is a simple, unofficial, ruby client API
# for using Google Translate.
#
# Author::    Dingding Ye  (mailto:yedingding@gmail.com)
# Copyright:: Copyright (c) 2007 Dingding Ye
# License::   Distributes under MIT License

module Translate
  class UnsupportedLanguagePair < StandardError
  end

  class RTranslate
    # Google AJAX Language REST Service URL
    GOOGLE_TRANSLATE_URL = "http://ajax.googleapis.com/ajax/services/language/translate"

    # Default version of Google AJAX Language API
    DEFAULT_VERSION = "1.0"

    attr_reader :version, :key
    attr_reader :default_from, :default_to

    class << self
      def translate(text, from, to)
        RTranslate.new.translate(text, { :from => from, :to => to })
      end
      alias_method :t, :translate

      def translate_strings(text_array, from, to)
        RTranslate.new.translate_strings(text_array, {:from => from, :to => to})
      end

      def translate_string_to_languages(text, options)
        RTranslate.new.translate_string_to_languages(text, options)
      end

      def batch_translate(translate_options)
        RTranslate.new.batch_translate(translate_options)
      end
    end

    def initialize(version = DEFAULT_VERSION, key = nil, default_from = nil, default_to = nil)
      @version = version
      @key = key
      @default_from = default_from
      @default_to = default_to

      if @default_from && !(Google::Lanauage.supported?(@default_from))
        raise StandardError, "Unsupported source language '#{@default_from}'"
      end

      if @default_to && !(Google::Lanauage.supported?(@default_to))
        raise StandardError, "Unsupported destination language '#{@default_to}'"
      end
    end

    # translate the string from a source language to a target language.
    #
    # Configuration options:
    # * <tt>:from</tt> - The source language
    # * <tt>:to</tt> - The target language
    # * <tt>:userip</tt> - The IP address of the end-user on whose behalf the request is being made
    def translate(text, options = { })
      from = options[:from] || @default_from
      to = options[:to] || @default_to
      if (from.nil? || Google::Language.supported?(from)) && Google::Language.supported?(to)
        from = from ? Google::Language.abbrev(from) : nil
        to = Google::Language.abbrev(to)
        langpair = "#{from}|#{to}"

        text.mb_chars.scan(/(.{1,300})/).flatten.inject("") do |result, st|
          url = "#{GOOGLE_TRANSLATE_URL}?q=#{CGI.escape(st.to_s)}&langpair=#{CGI.escape(langpair)}&v=#{@version}"
          url << "&key=#{@key}" if @key          
          url << "&userip=#{options[:userip]}" if options[:userip]
          
          result += CGI.unescapeHTML(do_translate(url))
        end
      else
        raise UnsupportedLanguagePair, "Translation from '#{from}' to '#{to}' isn't supported yet!"
      end
    end

    # translate several strings, all from the same source language to the same target language.
    #
    # Configuration options
    # * <tt>:from</tt> - The source language
    # * <tt>:to</tt> - The target language
    def translate_strings(text_array, options = { })
      text_array.collect do |text|
        self.translate(text, options)
      end
    end

    # Translate one string into several languages.
    #
    # Configuration options
    # * <tt>:from</tt> - The source language
    # * <tt>:to</tt> - The target language list
    # Example:
    #
    # translate_string_to_languages("China", {:from => "en", :to => ["zh-CN", "zh-TW"]})
    def translate_string_to_languages(text, option)
      option[:to].collect do |to|
        self.translate(text, { :from => option[:from], :to => to })
      end
    end

    # Translate several strings, each into a different language.
    #
    # Examples:
    #
    # batch_translate([["China", {:from => "en", :to => "zh-CN"}], ["Chinese", {:from => "en", :to => "zh-CN"}]])
    def batch_translate(translate_options)
      translate_options.collect do |text, option|
        self.translate(text, option)
      end
    end

    private
    def do_translate(url) #:nodoc:
      jsondoc = Net::HTTP.get(URI.parse(url))
      response = JSON.parse(jsondoc)
      if response["responseStatus"] == 200
        response["responseData"]["translatedText"]
      else
        raise StandardError, response["responseDetails"]
      end
    rescue Exception => e
      raise StandardError, e.message
    end
  end
end
