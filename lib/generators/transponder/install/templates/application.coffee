# this is where you require all the files
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require transponder

# this part boots up the transponder app
#= require application/initializers/setup
#= require_tree ./application/services
#= require_tree ./application/helpers
#= require_tree ./application/presenters
#= require application/initializers/boot
#= require application/initializers/manifest