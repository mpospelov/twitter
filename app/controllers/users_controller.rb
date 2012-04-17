class UsersController < ApplicationController
  before_filter :check_user, :only => [:edit,:destroy]

  def new
    @user = User.new
  end

  def create
    @user=User.new(params[:user])
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      redirect_to login_path, :notice => "Hi!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        UserMailer.updating_confirmation(@user).deliver
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.new
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    session[:user_id]=nil
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  def followers
    @relationships = Relationship.all
  end

  def following
    @relationships = current_user.relationships
  end

  private
  def check_user
    if params[:id].to_i!=current_user.id
      redirect_to user_path(current_user), :notice => "You don't have permission"
    end
  end
end
