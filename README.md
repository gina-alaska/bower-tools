# Bower::Tools

Adds some rake tasks and a generator for configuring a rails application to work with the bower js installer. This simplifies use of bower in rails applications. 

For example [GINA map layers](https://github.com/gina-alaska/gina-map-layers) is now bower installable, just see the [README](https://github.com/gina-alaska/gina-map-layers/blob/master/README.md)

## Installation

Add this line to your application's Gemfile:

    gem 'bower-tools', git: 'https://github.com/gina-alaska/bower-tools'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bower-tools

## Usage

Install the .bowerrc file, this will configure bower to install all libs into the vendor/assets/bower_components dir

    rails g bower:tools:install

Now just use bower as you normally would, no other changes required

    bower install bootstrap

## Rake tasks

* `rake bower:resolve_asset_path` will modified and rename css files to use the `asset_path` helper method.  It is automatically set to run before doing an asset:precompile task.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
