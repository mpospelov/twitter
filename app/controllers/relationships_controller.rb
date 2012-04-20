class RelationshipsController < ApplicationController
  def create
    @relationship = current_user.relationships.new(params[:relationship])
    @relationship.save
    redirect_to user_path(current_user)
  end
  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to user_path(current_user)
  end

end

