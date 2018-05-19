class HomeController < ApplicationController
  helper_method :latest_articles
  helper_method :admin
  helper_method :message

  def index
  end

  private

  def latest_articles
    @articles ||= ArticleDecorator.decorate_collection(Article.latest)
  end

  def admin
    @admin ||= Admin.first.decorate
  end

  def message
    @message ||= Message.new
  end
end
