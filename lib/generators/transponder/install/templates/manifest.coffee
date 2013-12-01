<%= file_name.camelize %>.services_manifest = ->
  # fill in your manifest here
  # example:
  # if you want to trigger a service on your entire app
  # $('body').trigger '<%= file_name.downcase %>:services:service_name'
  # 
  # If you want a more fine grained control for 
  # different pages you can add a class to your body 
  # in your views/layouts/application.html.erb
  # on your body tag you can do something like this
  #
  # <body class="[controller_name] [action_name]">
  #
  # You now have a more fine grained control in 
  # your manifest file
  # $('body.posts.show').trigger '<%= file_name.downcase %>:services:service_name'
  #
  # if you need to trigger the same services on multiple pages
  # $('body.posts.show,
  #    body.dashboard.show,
  #    body.photos.index').trigger '<%= file_name.downcase %>:services:service_name'
  # 

<%= file_name.camelize %>.run_ready = ->
  <%= file_name.camelize %>.services_manifest()

$(document).ready <%= file_name.camelize %>.run_ready
$(document).on 'page:load', <%= file_name.camelize %>.run_ready