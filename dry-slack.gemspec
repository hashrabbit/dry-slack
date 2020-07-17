require_relative 'lib/dry/slack/version'

Gem::Specification.new do |spec|
  spec.name          = "dry-slack"
  spec.version       = Dry::Slack::VERSION
  spec.authors       = ["Brian V. Hughes"]
  spec.email         = ["brianvh89@gmail.com"]

  spec.summary       = 'A dry-rb inspired Slack communication library.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/hashrabbit/dry-lifecycle'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/hashrabbit/dry-slack'
  spec.metadata['changelog_uri'] = 'https://github.com/hashrabbit/dry-slack/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'dry-matcher', '~> 0.8.3'
  spec.add_runtime_dependency 'dry-monads', '~> 1.3.5'
  spec.add_runtime_dependency 'dry-struct', '~> 1.3.0'
  spec.add_runtime_dependency 'dry-validation', '~> 1.5.1'
  spec.add_runtime_dependency 'json', '~> 2.3.0'
  spec.add_runtime_dependency 'rest-client', '~> 2.1.0'

  spec.add_development_dependency 'bundler', '~> 2.1.2'
  spec.add_development_dependency 'rack', '~> 2.2.3'
  spec.add_development_dependency 'rake', '~> 13.0.1'
  spec.add_development_dependency 'dotenv', '~> 2.7.5'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'rubocop', '~> 0.87.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.41.0'
  spec.add_development_dependency 'webmock', '~> 3.8.3'
end
