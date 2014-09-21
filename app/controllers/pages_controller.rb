class PagesController < ApplicationController
  def home
    @articles = Article.published
  end

  def about
  end

  def contact
  end
end
