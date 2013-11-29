# this is where you require all the files
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require transponder

# this part boots up the transponder app
#= require <%= file_name %>/initializers/setup
#= require_tree ./<%= file_name %>/services
#= require_tree ./<%= file_name %>/helpers
#= require_tree ./<%= file_name %>/presenters
#= require <%= file_name %>/initializers/boot
#= require <%= file_name %>/initializers/manifest