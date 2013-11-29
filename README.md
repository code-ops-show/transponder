# Transponder
[![Build Status](https://www.travis-ci.org/artellectual/transponder.png?branch=master)](https://www.travis-ci.org/artellectual/transponder) - Master (current release)
[![Build Status](https://travis-ci.org/artellectual/transponder.png?branch=develop)](https://travis-ci.org/artellectual/transponder)

Transponder is a opinionated javascript library for assisting in working with front end heavy rails app.

## Installation

Add this line to your application's Gemfile:

    gem 'transponder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install transponder

## Usage

Once installing the gem run.

    $ rails g transponder:install

### Presenters
Presenter's jobs are to take the response from the server usually html fragment that is rendered by rails and output it to the screen. The reason why we have presenters is so that we can do things to the content before outputting it.

Presenters usually map to your controller action in rails. By default it supports the 7 basic restful actions 

+ index
+ new
+ edit
+ show
+ create
+ update
+ destroy

However you can override this and add your own custom presenter actions if you want. Its not necessary that the presenter action maps to your rails controller action.


## TODO - Whats Coming

  + Clean up some APIs
  + Add Documentation
  + Video Screencasts
  + More Generators
  + Example Rails Project

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

