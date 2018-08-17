class CommentDecorator < Draper::Decorator
  delegate_all

  def creation_time
    published_at&.strftime('%b %d, %Y @ %H:%M')
  end
end
