lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hokiespa/version'
require "bundler/gem_tasks"

task :build do
  system "rm -fr hokiespa"
  system "git clone git@github.com:tylerkahn/hokiespa.git"
  system "cd hokiespa; git checkout #{HokieSpa::PYTHON_VERSION}"
  system "gem build hokiespa.gemspec"
end
