class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  before_filter :authenticate_user!
  def index
    @articles = Article.all
    
  end

  def show

  end

  def new
    @article = Article.new
    
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if Article.all.nil?
      @article.articleId=1
    else
      @article.articleId = Article.all.count+1
    end
    @article.managerId=current_user.id
    @article.publicationDate=Time.now
    @article.articleTitle= article_params[:articleTitle].upcase
    @article.save
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Noticia creada correctamente.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'La noticia se ha modificado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @bike }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_path, notice: 'La noticia se  ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:articleId, :articleTitle, :managerId, :publicationDate, :body, :summary)
  end
end
