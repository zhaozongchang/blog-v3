class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:favorite, :unfavorite, :upvote, :downvote]
  before_action :validate_search_key, only: [:search]
  impressionist :actions=>[:show]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    impressionist(@post)
  end

  def search
    if @query_string.present?
      @posts = search_params    #搜索post的关键词
    end
  end

  def ruby
    @posts = Post.where(:category_id => 1)
  end

  def rails
    @posts = Post.where(:category_id => 2)
  end

  def linux
    @posts = Post.where(:category_id => 3)
  end

  def css
    @posts = Post.where(:category_id => 4)
  end

  def html
    @posts = Post.where(:category_id => 5)
  end

  def skill #百宝箱
    @posts = Post.where(:category_id => 6)
  end

  def database
    @posts = Post.where(:category_id => 7)
  end

  def javascript
    @posts = Post.where(:category_id => 8)
  end

  def upward #成长
    @posts = Post.where(:category_id => 9)
  end

  def favorite
    @post = Post.find(params[:id])
    current_user.favorite_posts << @post
    flash[:notice] = "已收藏文章"
    redirect_back fallback_location: root_path
  end

  def unfavorite
    @post = Post.find(params[:id])
    current_user.favorite_posts.delete(@post)
    flash[:notice] = "已取消收藏"
    redirect_back fallback_location: root_path
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  protected

  def validate_search_key
       # gsub 是Ruby中正则表达式的方法，它会切换所有匹配到的部分
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")if params[:q].present?
  end

  def search_params
    Post.ransack({:title_or_content_cont => @query_string}).result(distinct: true)
    #title与content是post的两个栏位，而我们的关键词出自这里
  end



  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
