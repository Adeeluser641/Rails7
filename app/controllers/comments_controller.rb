class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.commenter = current_user.email # Set commenter as the user's email

    if @comment.save
      redirect_to @post, notice: 'Comment created successfully.'
    else
      flash[:alert] = "Error creating comment: " + @comment.errors.full_messages.join(', ')
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      redirect_to @post, notice: 'Comment deleted successfully.'
    else
      redirect_to @post, alert: 'You are not authorized to delete this comment.'
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
