class Api::V1::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render json: @articles
  end


  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: 201
    else
      render json: {error: @article.errors.full_messages}, status: 500
    end
  end


  def show
    @article = Article.find(params[:id])
    render json: @article, status: :ok
  end


  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if @article.save
      render json: @article
    else
      render json: {error: @article.errors.full_messages}
    end
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    render json: {message:"Article Deleted"}
  end


  private

  def article_params
    params.require(:article).permit(:link, :title, :publication_date, tag_ids: [])
  end
end
