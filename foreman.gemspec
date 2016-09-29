$:.unshift File.expand_path("../lib", __FILE__)
require "foreman/version"

Gem::Specification.new do |gem|
  gem.name     = "foreman-systemd"
  gem.license  = "MIT"
  gem.version  = Foreman::VERSION

  gem.author   = "Adrian Serafin"
  gem.email    = "adrian@softmad.pl"
  gem.homepage = "https://github.com/aserafin/foreman"
  gem.summary  = "Process manager for applications with multiple components"

  gem.description = gem.summary

  gem.executables = "foreman"
  gem.files = Dir["**/*"].select { |d| d =~ %r{^(README|bin/|data/|ext/|lib/|spec/|test/)} }
  gem.files << "man/foreman.1"

  gem.add_dependency 'thor', '~> 0.19.1'

  if ENV["PLATFORM"] == "mingw32"
    gem.add_dependency "win32console", "~> 1.3.0"
    gem.platform = Gem::Platform.new("mingw32")
  end
end
