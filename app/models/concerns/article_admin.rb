module ArticleAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :bio, :froala do
          config_options do
            {
              inlineMode: false,
              paragraphy: false
            }
          end
        end
      end
    end
  end
end
