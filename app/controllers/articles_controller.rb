class ArticlesController < ApplicationController

  def index
    @articles = Article.published
  end

  def show
    @article = Article.friendly.find(params[:id])
  end

end
