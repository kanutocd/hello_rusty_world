# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

require "rb_sys/extensiontask"
require "rake/clean"

task build: :compile

GEMSPEC = Gem::Specification.load("hello_rusty_world.gemspec")
RUBY_VERSION_REQUIREMENT = GEMSPEC.required_ruby_version.to_s
CROSS_PLATFORMS = %w[
  x86_64-linux
  aarch64-linux
  x86_64-darwin
  arm64-darwin
  x64-mingw-ucrt
].freeze

RbSys::ExtensionTask.new("hello_rusty_world", GEMSPEC) do |ext|
  ext.lib_dir = "lib/hello_rusty_world"
  ext.cross_compile = true
  ext.cross_platform = [ENV.fetch("RUBY_TARGET", nil)].compact
end

namespace :gem do
  desc "Build source and cross-compiled native gems into pkg/"
  task :native do
    rm_rf("pkg")
    Rake::Task["build"].invoke

    CROSS_PLATFORMS.each do |platform|
      sh(
        "bundle",
        "exec",
        "rb-sys-dock",
        "--platform",
        platform,
        "--ruby-versions",
        RUBY_VERSION_REQUIREMENT,
        "--build"
      )
    end
  end
end

task default: %i[compile spec rubocop]
