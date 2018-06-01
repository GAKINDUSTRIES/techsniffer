module ArticleAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :title
        field :published_at
        field :comments_permitted
        field :published
      end

      edit do
        field :title
        field :page_header
        field :summary
        field :body, :froala do
          config_options do
            {
              inlineMode: false,
              paragraphy: false
            }
          end
        end

        field :comments_permitted
        field :published
        field :published_at
      end
    end
  end
end
