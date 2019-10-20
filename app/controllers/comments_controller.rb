class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
  redirect_to post_path(@post)
else
  redirect_to post_path(@post), notice: '请写入评论内容！'
end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), alert: "成功删除评论"
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
