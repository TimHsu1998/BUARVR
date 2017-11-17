class NewsController < ApplicationController
  before_action :admin_required, only: [:new, :create, :show, :edit, :destroy]

  def index
    @news = News.order("created_at DESC")
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to news_index_path
    else
      render :new
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      redirect_to news_index_path
    else
      render :edit
    end
  end

  def show
    @news = News.find(params[:id])
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to news_index_path
  end

  private

  def news_params
    params.require(:news).permit(:title, :content, :image)
  end
end
