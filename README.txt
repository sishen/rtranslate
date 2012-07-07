= google-api-translate-ruby
A simple, unofficial, ruby client API for using Google Translate.

== Install

# in your Gemfile:
gem "sishen-rtranslate" , :require => 'rtranslate', :git => 'git://github.com/zed-0xff/rtranslate.git'

== Usage
1.
{{{
require "rtranslate"
result = Translate.t("xxx", Language::English, Language::CHINESE_SIMPLIFIED)
}}}

2.
{{{
$rtranslate -f en -t zh-CN xxx
}}}

Check test for more examples

== COPYRIGHT

Copyright (c) 2007 Dingding Ye <yedingding@gmail.com>
Distributed under MIT License
