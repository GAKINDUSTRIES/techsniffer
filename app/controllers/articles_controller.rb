class ArticlesController < ApplicationController
  helper_method :article

  def show; end

  def index
  end

  private

  def article
    @article ||= Article.find(params[:id])
  end
end
