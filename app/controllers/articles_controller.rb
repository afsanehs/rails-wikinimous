class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @new_article = Article.new
  end

  def create
    article = Article.new(strong_params)
    article.save
    redirect_to index_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(strong_params)
    redirect_to index_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to index_path
  end

  private

  def strong_params
    params.require(:article).permit(:title, :content)
  end
end
