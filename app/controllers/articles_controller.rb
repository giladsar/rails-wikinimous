class ArticlesController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show

  end

  def edit
  end

  def update
    @article.update(user_permit)
    redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(user_permit)
    redirect_to articles_path

  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find
    @article = Article.find(params[:id])
  end
  def user_permit
    params.require(:article).permit([:title, :content])
  end
end
