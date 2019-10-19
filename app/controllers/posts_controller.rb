class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
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



  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
