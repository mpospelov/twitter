class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user=User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Hi!"
    else
      render "new"
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
