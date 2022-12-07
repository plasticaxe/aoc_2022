# frozen_string_literal: true

require_relative 'lib/aoc_2022/version'

Gem::Specification.new do |spec|
  spec.name    = 'aoc_2022'
  spec.version = Aoc2022::VERSION
  spec.authors = ["James O'Shea"]
  spec.email   = ['plasticaxe@gmail.com']

  spec.summary               = 'Advent of Code 2022'
  spec.homepage              = 'https://github.com/plasticaxe/aoc_2022'
  spec.license               = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/plasticaxe/aoc_2022'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__, __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'geom'
  spec.add_dependency 'rubocop-rake'
  spec.add_dependency 'rubocop-rspec'
  spec.add_dependency 'rubytree'
  spec.add_dependency 'thor'
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
