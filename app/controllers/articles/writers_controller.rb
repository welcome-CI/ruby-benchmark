module Articles
  class WritersController < ApplicationController
    before_action :set_article, only: %i[edit update]

    def edit
      @article.articles_writers.build
    end

    def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_article
      @article = Article.find(params[:article_id])
    end

    def article_params
      params.require(:article).permit(articles_writers_attributes: %i[id writer_id _destroy])
    end
  end
end
