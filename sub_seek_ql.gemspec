require_relative 'lib/sub_seek_ql/version'

Gem::Specification.new do |spec|
  spec.name          = "sub_seek_ql"
  spec.version       = SubSeekQl::VERSION
  spec.authors       = ["Collin Jilbert"]
  spec.email         = ["cjilbert504@gmail.com"]

  spec.summary       = %q{Methods for doing sub queries with ActiveRecord.}
  spec.description   = %q{Methods for doing sub queries with ActiveRecord. Built so that you don't have to write raw SQL, but you should learn SQL anyway so that you understand what's going on.}
  spec.homepage      = "https://github.com/cjilbert504/sub_seek_ql"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cjilbert504/sub_seek_ql"
  spec.metadata["changelog_uri"] = "https://github.com/cjilbert504/sub_seek_ql/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
