class UsersController < ApplicationController

  def edit
    user = User.find(params[:id])
    if user.id == current_user.id
      user.update(user_params)
  end

  private
  def user_params
    redirect_to action: :index
  end
end
