class PagesController < ApplicationController
  def home
    @articles = Article.published.order(:published_at).limit(9)
  end

  def about
  end

  def contact
  end
end
