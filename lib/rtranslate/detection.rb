# The program is a simple, unofficial, ruby client API
# for using Google Translate.
#
# Author::    Dingding Ye  (mailto:yedingding@gmail.com)
# Copyright:: Copyright (c) 2007 Dingding Ye
# License::   Distributes under MIT License

module Translate
  class DetectionResponse
    attr_reader :abbrev
    attr_reader :language
    attr_reader :reliability
    attr_reader :confidence

    def initialize(json)
      @abbrev = json["language"]
      @language = Google::Language::Languages[@abbrev]
      @reliability = json["isReliable"]
      @confidence = json["confidence"]
    end

    def to_s
      abbrev
    end
  end

  class Detection
    # Google AJAX Language REST Service URL
    GOOGLE_DETECTION_URL = "http://ajax.googleapis.com/ajax/services/language/detect"

    # Default version of Google AJAX Language API
    DEFAULT_VERSION = "1.0"

    attr_reader :version, :key

    class << self
      def detect(text)
        Detection.new.detect(text)
      end
      alias_method :d, :detect
    end

    def initialize(version = DEFAULT_VERSION, key = nil)
      @version = version
      @key = key
    end

    def detect(text, options = {:details => false})
      url = "#{GOOGLE_DETECTION_URL}?q=#{CGI.escape(text)}&v=#{@version}"
      url << "&key=#{@key}" if @key
      url << "&userip=#{options[:userip]}" if options[:userip]
      
      detection_response = do_detect(url)
      options[:details] ? detection_response : detection_response.abbrev
    end

    private
    def do_detect(url)
      jsondoc = Net::HTTP.get(URI.parse(url))
      response = JSON.parse(jsondoc)
      if response["responseStatus"] == 200
        DetectionResponse.new(response["responseData"])
      else
        raise StandardError, response["responseDetails"]
      end
    rescue Exception => e
      raise StandardError, e.message
    end
  end
end
