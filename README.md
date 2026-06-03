# HelloRustyWorld

HelloRustyWorld is a tiny Ruby gem with a Rust native extension.

The project goal is to make native gem development stupidly boring for two
groups:

- Contributors get one setup command, one local check command, and one explicit
  cross-compilation check that leaves native gems in `pkg/`.
- Gem consumers get normal RubyGems installs backed by precompiled native gems,
  so they should not need Rust, Cargo, or a compiler for supported platforms.

The Ruby surface lives in `lib/hello_rusty_world`. The Rust extension lives in
`ext/hello_rusty_world`.

## Installation

TODO: Replace `hello_rusty_world` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add hello_rusty_world
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install hello_rusty_world
```

## Usage

```ruby
require "hello_rusty_world"

HelloRustyWorld.hello("world")
#=> "Hello world, from Rust!"
```

## Development

After checking out the repo, run:

```bash
bin/setup
```

That installs Ruby dependencies and fetches Cargo dependencies.

For the normal development loop, run:

```bash
bin/dev-check
```

This compiles the Rust extension, runs the RSpec suite, and runs RuboCop through
the default `rake` task.

For just the native gem package on the current platform, run:

```bash
bin/dev-check-native
```

For the full cross-compiled native gem matrix, run:

```bash
bin/dev-check-cross
```

That builds the source gem plus cross-compiled native gems into `pkg/`. Seeing
these platform gems there is the success condition for native packaging:

- `hello_rusty_world-*-x86_64-linux.gem`
- `hello_rusty_world-*-aarch64-linux.gem`
- `hello_rusty_world-*-x86_64-darwin.gem`
- `hello_rusty_world-*-arm64-darwin.gem`
- `hello_rusty_world-*-x64-mingw-ucrt.gem`

The task uses the `rake native` tasks created by `RbSys::ExtensionTask` inside
`rb-sys-dock`/`rake-compiler-dock` containers, so Docker is required.

You can also run the individual tasks directly:

```bash
bundle exec rake compile
bundle exec rake spec
bundle exec rake rubocop
```

The GitHub Actions release workflow builds the source gem and the native gem
matrix. Local development should stay focused on `bin/dev-check` unless you are
changing native packaging behavior.

Use `bin/console` for an interactive prompt that loads the gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kanutocd/hello_rusty_world. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kanutocd/hello_rusty_world/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HelloRustyWorld project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kanutocd/hello_rusty_world/blob/main/CODE_OF_CONDUCT.md).
