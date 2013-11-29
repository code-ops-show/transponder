window.<%= file_name.camelize %> =
  Helpers: {}
  Services: {}
  Presenters: {}

<% if options[:shared] %>
# include these lines in your other apps
# #= require <%= file_name %>/initializers/setup
# #= require_tree ./<%= file_name %>/services
# #= require_tree ./<%= file_name %>/helpers
# #= require_tree ./<%= file_name %>/presenters
# #= require <%= file_name %>/initializers/boot
# #= require <%= file_name %>/initializers/manifest 
<% end %>