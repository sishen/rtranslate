require File.join(File.dirname(__FILE__), 'rtranslate/language')
require File.join(File.dirname(__FILE__), 'rtranslate/rtranslate')
require 'uri'
require 'open-uri'

begin
  require 'hpricot'
rescue LoadError
  require 'rubygems'
  require 'hpricot'
end

$KCODE = 'u'

include Translate
def Translate.t(text, from, to)
  begin
    RTranslate.translate(text, from, to)
  rescue
    "Error: " + $!
  end
end

