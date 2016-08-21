# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cyoku_wav/version'

Gem::Specification.new do |spec|
  spec.name          = "cyoku_wav"
  spec.version       = CyokuWav::VERSION
  spec.authors       = ["shinokaro"]
  spec.email         = ["shinokaro@hotmail.co.jp"]

  spec.summary       = %q{Read the IO stream or String object of WAV format}
  spec.description   = <<~EOT
    WAV (PCM only) to get the audio data of a string object.
    There are accessor to the audio format.
    Read only supports.
  EOT
  spec.homepage      = "https://github.com/shinokaro/cyoku_wav"
  spec.license       = "zlib"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
