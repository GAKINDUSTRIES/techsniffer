RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end

  config.current_user_method(&:current_admin)
  config.included_models = %w[Admin WorkExperience Skill Recommendation]

  # Display empty fields
  config.compact_show_view = false

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
