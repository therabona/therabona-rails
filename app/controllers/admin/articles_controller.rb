class Admin::ArticlesController < ApplicationController
  http_basic_authenticate_with name: "therabona", password: "TheRabona14"
  before_action :set_article, only: [:show, :edit, :update, :publish, :destroy]

  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
    respond_to do |format|
      format.html { render }
      format.js { render partial: "form", layout: false }
    end
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to [:admin, @article], notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to [:admin, @article], notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def publish
    if @article.update({ published: true, published_at: Date.today })
      redirect_to admin_articles_url, notice: 'Article was successfully published.'
    else
      render :index
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :kind, :body, :published, attachments_attributes: [:id, :article_id, :file, :_destroy])
    end

end
