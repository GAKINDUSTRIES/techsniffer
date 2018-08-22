class ArticlesController < ApplicationController
  helper_method :article
  helper_method :comment
  helper_method :admin
  helper_method :comments

  def show; end

  def index
    @articles = Article.desc_order.page(params[:page]).decorate
    @current_page = params[:page] || 0
    @total_articles = Article.count
    @per_page = Article.default_per_page
  end

  private

  def admin
    @admin ||= Admin.first.decorate
  end

  def article
    @article ||= Article.find_by(slug: params[:slug]).decorate
  end

  # TODO, paginate collection
  def comments
    @comments ||= article.comments.includes(:user).ordered_by_date.decorate
  end

  def comment
    @comment ||= Comment.new
  end
end
