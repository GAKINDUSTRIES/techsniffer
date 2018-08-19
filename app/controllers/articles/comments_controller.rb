module Articles
  class CommentsController < ApplicationController
    helper_method :article
    helper_method :comments

    before_action :authenticate_user!, only: :create

    def create
      respond_to do |format|
        format.js do
          article.comments.create(comment_params)
          @comments = article.comments.includes(:user).ordered_by_date.decorate
        end
      end
    end

    private

    def comment_params
      params.require(:comment)
            .permit(:message)
            .merge(user: current_user)
    end

    def comments
      @comments ||= article.comments.includes(:user).ordered_by_date.decorate
    end

    def article
      @article ||= Article.find_by(slug: params[:article_slug]).decorate
    end
  end
end
