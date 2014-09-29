class PagesController < ApplicationController
  def home
    @articles = Article.published.order(:published_at)
  end

  def about
  end

  def contact
  end
end
