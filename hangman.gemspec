# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name = 'hangman'
  gem.version = '2.0.0'
  gem.summary = 'The game hangman'
  gem.authors = ['Ben Daniels']
  gem.email = ['benbanj@hotmail.com']
  gem.files = Dir['lib/**', 'bin/*', 'spec/*.rb', 'static/**', '.rspec', 'Gemfile', 'Gemfile.lock']
  gem.homepage = "https://github.com/bendee48/hangman-2.0"
  gem.license = 'OML'
  gem.description = 'CLI version of the classic hangman game'
  gem.executables << 'hangman'
end