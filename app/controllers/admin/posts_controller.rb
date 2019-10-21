class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @post = Post.new(post_params)
    @post.category_id = params[:category_id]
    @post.user = current_user
  if @post.save
    redirect_to posts_path
  else
    render :new
  end
 end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @post = Post.find(params[:id])
    @post.category_id = params[:category_id]
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :author, :summary)
  end
end
