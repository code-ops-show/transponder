# Transponder
[![Build Status](https://travis-ci.org/artellectual/transponder.png?branch=master)](https://travis-ci.org/artellectual/transponder) - Master (current release)

[![Build Status](https://travis-ci.org/artellectual/transponder.png?branch=develop)](https://travis-ci.org/artellectual/transponder) - Develop (upcoming release)

Transponder is a opinionated javascript library for assisting in working with front end heavy rails app.

Transponder uncompressed is about 8kb minified & compressed (gzip) its 2kb

## Installation

Add this line to your application's Gemfile:

    gem 'transponder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install transponder

## Usage
There are 3 types of transponder module, minimal, basic, full by using the ```-t``` flag you can specify which type you want to use. If you don't specify a ```-t``` flag it will generate a basic module.

### Minimal
Minimal transponder modules are good for generating modules that will contain only services that will be used by other modules. Generally recommended to use in combination with the ```--shared``` flag

    $ rails g transponder:install utilities -t minimal --shared

### Basic
Basic transponder modules come with 3 basic things, helpers, services, and presenters. If you want to work with rails controller you will need to use the basic module type.

    $ rails g transponder:install application

### Full
Full transponder modules come with transponder's primitives and placeholders for a backbone app, it will setup the integration for a backbone app into your transponder module.

    $ rails g transponder:install application -t full

## Primitives

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

### Services
Services are things that apply to alot of items on the page. You could think of these parts of the page as 'widget' and they all have a certain kind of behavior. The behavior of these widgets can be defined by services. Each widget can have the behavior of multiple services.

Some example of services

+ File uploader
+ Poller
+ Push notification subscriber
+ Syntax Highlighter
+ Search Bar

Services are very modular and they can be applied to multiple widgets in a page without conflicting with each other and without rebinding widgets that already have these behaviors.


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

## Credits
Gem developed by [Zack Siri](http://github.com/zacksiri) of [Artellectual](http://www.artellectual.com)

