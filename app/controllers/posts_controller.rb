class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post=Post.new(params[:post])
    @user = current_user
    @post.user_id = @user.id
    @post.save

    redirect_to user_path(current_user)

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
  end
end
