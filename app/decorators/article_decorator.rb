class ArticleDecorator < Draper::Decorator
  delegate_all

  def published_date
    published_at&.strftime('%b %d, %Y')
  end

  def comment_count
    number_of_comments = comments.count

    if number_of_comments.zero?
      'No comments yet. Be the first one!'
    else
      "#{number_of_comments} Comments"
    end
  end
end
