# -*- coding: utf-8 -*-
$:.unshift File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'test/unit'
require 'rtranslate'

class Translate::DetectionTest < Test::Unit::TestCase
  include Google::Language
  def test_detection
    d = Detection.new
    assert_equal "es", d.detect("para poner este importante proyecto en práctica")
    assert_equal "en", d.detect("this is a test of the Emergency text categorizing system.")
    assert_equal "fr", d.detect("serait désigné peu après PDG d'Antenne 2 et de FR 3. Pas même lui ! Le")
    assert_equal "it", d.detect("studio dell'uomo interiore? La scienza del cuore umano, che")
    assert_equal "ro", d.detect("taiate pe din doua, in care vezi stralucind brun  sau violet cristalele interioare")
    assert_equal "pl", d.detect("na porozumieniu, na ³±czeniu si³ i ¶rodków. Dlatego szukam ludzi, którzy")
    assert_equal "de", d.detect("sagt Hühsam das war bei Über eine Annonce in einem Frankfurter der Töpfer ein. Anhand von gefundenen gut kennt, hatte ihm die wahren Tats
achen Sechzehn Adorno-Schüler erinnern und daß ein Weiterdenken der Theorie für ihre Festlegung sind drei Jahre Erschütterung Einblick in die Abhängigkeit der Bauarbeiten
 sei")
    assert_equal "fi", d.detect("koulun arkistoihin pölyttymään, vaan nuoret saavat itse vaikuttaa ajatustensa eteenpäinviemiseen esimerkiksi")
    assert_equal "sv", d.detect("enligt all sannolikhet för att få ro oavsiktligt intagit en för")
    assert_equal "hu", d.detect("esôzéseket egy kissé túlméretezte, ebbôl kifolyólag a Földet egy hatalmas árvíz mosta el")
    assert_equal "fi", d.detect("koulun arkistoihin pölyttymään, vaan nuoret saavat itse vaikuttaa ajatustensa eteenpäinviemiseen esimerkiksi")
    assert_equal "nl", d.detect("tegen de kabinetsplannen. Een speciaal in het leven geroepen Landelijk")
    assert_equal "da", d.detect("viksomhed, 58 pct. har et arbejde eller er under uddannelse, 76 pct. forsørges ikke længere af Kolding")
    assert_equal "cs", d.detect("datují rokem 1862.  Naprosto zakázán byl v pocitech smutku, beznadìje èi jiné")
    assert_equal "no", d.detect("hånd på den enda hvitere restaurant-duken med en bevegelse så forfinet")
    assert_equal "pt", d.detect("popular. Segundo o seu biógrafo, a Maria Adelaide auxiliava muita gente")
    assert_equal "en", d.detect("TaffyDB finders looking nice so far!")
  end
end
