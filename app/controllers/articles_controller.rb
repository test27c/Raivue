class ArticlesController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # Temp user 
    @article.user = User.first
    if @article.save
      flash[:success] = "Article created"
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:success] = "Article deleted"
    redirect_to articles_path
  end

  private

    def require_same_user
      if current_user != @article.user
        flash[:danger] = "You can only edit or delete your own article"
        redirect_to root_path
    end

    def set_user
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end