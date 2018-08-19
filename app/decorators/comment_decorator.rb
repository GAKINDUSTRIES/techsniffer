class CommentDecorator < Draper::Decorator
  delegate_all

  def creation_time
    created_at&.strftime('%b %d, %Y @ %H:%M')
  end
end
