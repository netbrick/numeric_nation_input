# -*- encoding: utf-8 -*-
require File.expand_path('../lib/numeric_nation_input/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'numeric_nation_input'
  s.version = NumericNationInput::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = %w(jan.strnadek@gmail.com)
  s.email = []
  s.homepage = 'https://github.com/netbrick/numeric_nation_input'
  s.summary = 'Implementation of saving nation numerc inputs in AR'
  s.description = "Implementation of saving nation numerc inputs in AR"

  s.required_rubygems_version = '>= 1.3.6'

  s.add_dependency 'activerecord', '~> 3.2'

  s.add_development_dependency 'bundler', '>= 1.0.0'
  s.add_development_dependency 'rake'

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files`.split("\n").map { |f| f =~ /^bin\/(.*)/ ? $1 : nil }.compact
  s.require_path = 'lib'
end
