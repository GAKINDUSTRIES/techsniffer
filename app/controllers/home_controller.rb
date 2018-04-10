class HomeController < ApplicationController
  helper_method :latest_articles

  def index
  end

  private

  def latest_articles
    @articles ||= Article.latest
  end
end
