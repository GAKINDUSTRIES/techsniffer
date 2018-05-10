class HomeController < ApplicationController
  helper_method :latest_articles
  helper_method :admin

  def index
  end

  private

  def latest_articles
    @articles ||= Article.latest
  end

  def admin
    @admin ||= Admin.first.decorate
  end
end
