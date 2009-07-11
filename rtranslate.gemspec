Gem::Specification.new do |s|
  s.name = %q{rtranslate}
  s.version = "1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ye Dingding"]
  s.date = %q{2009-07-11}
  s.description = %q{rtranslate is a simple, unofficial, ruby client API for using Google Translate.}
  s.email = %q{yedingding@gmail.com}
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "MIT-LICENSE", "Manifest.txt", "README.txt", "Rakefile", "rtranslate.gemspec", "bin/rtranslate",
             "lib/rtranslate.rb", "lib/rtranslate/language.rb", "lib/rtranslate/rtranslate.rb", "tests/ts_translate.rb", 
             "bin/rtranslate", "lib/rtranslate.rb", "lib/rtranslate/language.rb",
             "lib/rtranslate/rtranslate.rb", "lib/rtranslate/detection.rb", "tests/ts_detection.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://sishen.lifegoo.com}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{a simple, unofficial, ruby client API for using Google Translate}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
      s.add_development_dependency(%q<rspec>, [">= 1.1.4"])
      s.add_development_dependency(%q<json>, [">= 1.1.3"])
    else
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
      s.add_dependency(%q<rspec>, [">= 1.1.4"])
      s.add_dependency(%q<json>, [">= 1.1.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
    s.add_dependency(%q<rspec>, [">= 1.1.4"])
    s.add_dependency(%q<json>, [">= 1.1.3"])
  end
end
