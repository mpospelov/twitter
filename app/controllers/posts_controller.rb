class PostsController < ApplicationController
  respond_to :js, :only => :create
  def new
    @post = Post.new
  end

  def create
    @post=Post.new(params[:post])
    debugger
    @user = current_user
    @post.user_id = @user.id
    @post.save
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @post = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end
end
