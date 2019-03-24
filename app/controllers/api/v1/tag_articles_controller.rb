class Api::V1::TagArticlesController < ApplicationController
  def index
    @tag_articles = TagArticle.all
    render json: @tag_articles
  end

  def create
    @tag_article = TagArticle.new(tag_article_params)
    if @tag_article.save
      render json: @tag_article, status: 201
    else
      render json: {error: @tag_article.errors.full_messages}, status: 500
    end
  end


  def show
    @tag_article = TagArticle.find(params[:id])
    render json: @tag_article, status: :ok
  end


  def update

    @tag_article = TagArticle.find(params[:id])
    @tag_article.update(tag_article_params)
    if @tag_article.save
      render json: @tag_article
    else
      render json: {error: @tag_article.errors.full_messages}
    end
  end

  def destroy
    @tag_article = TagArticle.find(params[:id])
    @tag_article.destroy
    render json: {message:"TagArticle Deleted"}
  end



  private

  def tag_article_params
    params.require(:tag_article).permit(:tag_id, :article_id)
  end
end
