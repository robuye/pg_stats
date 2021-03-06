lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pg_stats/version'

Gem::Specification.new do |spec|
  spec.name          = "pg_stats"
  spec.version       = PgStats::VERSION
  spec.authors       = ["Rob Ulejczyk"]
  spec.email         = ["rulejczyk@gmail.com"]
  spec.summary   = %q{Exposes some statistics from Postgres.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"

  spec.add_dependency "pg"
end
