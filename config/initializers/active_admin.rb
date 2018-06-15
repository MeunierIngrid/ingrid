def authenticate_admin!
  redirect_to new_user_session_path unless current_user && current_user.admin
end

ActiveAdmin.setup do |config|
  config.site_title = "Ingrid Site"
  config.register_javascript 'ckeditor/init.js'
  config.authentication_method = :authenticate_admin!
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.logout_link_method = :delete
  config.batch_actions = true
  config.localize_format = :long
  config.include_default_association_filters = false
  config.comments = false
end


