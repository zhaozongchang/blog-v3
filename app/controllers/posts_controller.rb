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



  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
