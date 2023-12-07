class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if current_user != @post.user
      redirect_to root_path, alert: 'You are not authorized to edit this post.'
    end
  end

  def update
    if current_user == @post.user
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path, alert: 'You are not authorized to update this post.'
    end
  end

  def destroy
    if current_user == @post.user
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully deleted.'
    else
      redirect_to root_path, alert: 'You are not authorized to delete this post.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
