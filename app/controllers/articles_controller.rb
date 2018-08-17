class ArticlesController < ApplicationController
  helper_method :article
  helper_method :admin
  helper_method :comments

  def show; end

  def index; end

  private

  def admin
    @admin ||= Admin.first.decorate
  end

  def article
    @article ||= Article.find_by(slug: params[:slug]).decorate
  end

  # TODO, paginate collection
  def comments
    @comments ||= article.comments.includes(:user).ordered_by_date
  end
end
