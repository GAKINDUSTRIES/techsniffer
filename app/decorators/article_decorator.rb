class ArticleDecorator < Draper::Decorator
  delegate_all

  def published_date
    published_at&.strftime('%b %d, %Y')
  end
end
