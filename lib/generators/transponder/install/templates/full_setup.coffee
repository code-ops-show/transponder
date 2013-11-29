window.<%= file_name.camelize %> =
  Models: {}
  Collections: {}
  Views: {}
  Helpers: {}
  Services: {}
  Presenters: {}


<% if options[:shared] %>
# include these lines in your other apps
# #= require <%= file_name %>/initializers/setup
# #= require_tree ./<%= file_name %>/templates
# #= require_tree ./<%= file_name %>/models
# #= require_tree ./<%= file_name %>/collections
# #= require_tree ./<%= file_name %>/views
# #= require_tree ./<%= file_name %>/services
# #= require_tree ./<%= file_name %>/helpers
# #= require_tree ./<%= file_name %>/presenters
# #= require <%= file_name %>/initializers/boot
# #= require <%= file_name %>/initializers/manifest 
<% end %>
