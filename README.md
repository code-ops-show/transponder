# Transponder
[![Build Status](https://travis-ci.org/xpdr/transponder.png?branch=master)](https://travis-ci.org/artellectual/transponder) - Master (current release)

[![Build Status](https://travis-ci.org/xpdr/transponder.png?branch=develop)](https://travis-ci.org/artellectual/transponder) - Develop (upcoming release)

Transponder is a opinionated javascript library for assisting in working with front end heavy rails app.

Transponder uncompressed is about 8kb uncompressed / 2kb minified & compressed (gzip) 

## Installation

Add this line to your application's Gemfile:

    gem 'transponder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install transponder


## Generate a basic Module 

A transponder module provides some basic structure for your javascript code
```
rails g transponder:install application
```
This will generate a transponder 'module' in your ```app/assets/javascripts``` folder by the name of 'application', you can change the ```application``` to something else, but we recommend sticking with defaults until you understand more about transponder.

## Generate a Presenter

Presenters is perhaps one of the most important thing about Transponder, it allows you to use your server side templates in your client side code, cleanly and allows better reuseability of code.

```
rails g transponder:presenter contacts
```

Running this command will generate a presenter in your Transponder module ```application/presenters``` with the name ```contacts_presenter.coffee```


## How is this better than Rails UJS?

Typically with Rails UJS you would create a view with something like this 

Lets say you have a basic contacts_controller.rb

```ruby
class ContactsController < ApplicationController
  respond_to :json, :html, :js

  def index
    @contacts = Contact.all
    respond_with @contacts
  end
end
```

In your ```index.js.erb``` you would then have something like this 

```js
$('#contacts').html("<%= j render @contacts %>");
```

This Javascript code is evaled in the browser and content of the node with the id ```#contacts``` gets replaced with server side template that came from ```<%= j render @contacts %>``` This is fine however it has a few problems. First of all if you use coffeescript it has to be compiled in real time as its responding which adds to your response time. Secondly if you want to do more complex things in your response things can get very messy. Code reuse isn't that great either.

With Transponder you have a consistent way of working with your server side template. Lets take a look at the difference

In your ```index.js.erb``` transponder version would look something like this.

```js
["#contacts", "<%= xms_event %>", "<%= j render @contacts %>"]
```

Your server side response code using transponder will mostly likely look something like this. There is consistency to it. The first element is the DOM node you want to manipulate, the second element is what will allow the client side Transponder code to know which Presenter is responsible for this response and lastly we have the server side generated content.

### So what happens once this response gets to the client

Well in our presenter we would do something like this 

```coffee
class Application.Presenters.ContactsPresenter extends Transponder.Presenter
  presenterName: 'contacts'
  module: 'application'

  index: ->
    $(@element).html(@response)
```

The first 3 lines of code are generated by the presenter generator you were just using before the only line of code you should pay attention to here is the last 2. Basically the ```@element``` is the dom element you specified in ```index.js.erb``` and the ```@response``` is the content that was rendered by the server.

In the presenter you can do pretty much anything you want to your response before it gets output to the DOM. This gives a nice structure and consistency to the whole pattern. It allows you to mix server side templates with full client side programmability.

Testing is also much easier as now you've shifted the responsibility of the client side behavior to the client. We have more documentation coming on how to test your presenters.

## Typical Example

Here is a link to a more typical example with a controller / presenter that is more fleshed out. [Presenters: Typical Example](https://github.com/xpdr/transponder/wiki/Presenters:-Typical-Example). The code in the link is the controller / presenter code for this app here 
+ [kontax on heroku](http://kontax.herokuapp.com)
+ [kontax on github](http://github.com/xpdr/kontax)

Kontax is an example app for showcasing what Transponder is capable of doing. The larger and more complex an app becomes the more transponder shines. Especially if you want to build apps that need real time stuff.

## TODO - Whats Coming

  + Add Documentation
  + Video Screencasts
  + Add more features to Kontax
  + More documentation on Services

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits
Gem developed by [Zack Siri](http://github.com/zacksiri) of [Artellectual](http://www.artellectual.com)

