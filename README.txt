= google-api-transalte-ruby
A simple, unofficial, ruby client API for using Google Translate.

== Install

sudo gem install sishen-rtranslate

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
